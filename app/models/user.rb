# == Schema Information
# Schema version: 20090904144307
#
# Table name: users
#
#  id                        :integer(4)      not null, primary key
#  user_type                 :string(255)
#  login                     :string(40)
#  name                      :string(100)     default("")
#  email                     :string(100)
#  crypted_password          :string(40)
#  salt                      :string(40)
#  created_at                :datetime
#  updated_at                :datetime
#  remember_token            :string(40)
#  remember_token_expires_at :datetime
#  activation_code           :string(40)
#  activated_at              :datetime
#  password_reset_code       :string(40)
#  enabled                   :boolean(1)      default(TRUE)
#  identity_url              :string(255)
#  invitation_id             :integer(4)
#  invitation_limit          :integer(4)
#  cep                       :string(8)
#  professional_description  :string(255)
#  industry_id               :integer(4)
#  public_profile            :integer(4)
#  subdomain                 :string(255)
#  avatar_file_name          :string(255)
#  avatar_content_type       :string(255)
#  avatar_file_size          :integer(4)
#  avatar_updated_at         :datetime
#  cv                        :string(255)
#

require 'digest/sha1'
  
class User < ActiveRecord::Base
  has_friends
  has_many :sent_messages, :class_name => "Message", :foreign_key => "author_id"
  has_many :received_messages, :class_name => "MessageCopy", :foreign_key => "recipient_id"
  has_many :folders
  before_create :build_inbox

  acts_as_solr :fields => [:name, :professional_description]

  def inbox
    folders.find_by_name("Inbox")
  end

  def build_inbox
    folders.build(:name => "Inbox")
  end

  # ---------------------------------------
  # The following code has been generated by role_requirement.
  # You may wish to modify it to suit your need
  has_and_belongs_to_many :roles
  
  # has_role? simply needs to return true or false whether a user has a role or not.  
  # It may be a good idea to have "admin" roles return true always
  def has_role?(role_in_question)
    @_list ||= self.roles.collect(&:name)
    #return true if @_list.include?("admin")
    return (@_list.include?(role_in_question.to_s) )
  end
  # ---------------------------------------
  
  include Authentication
  include Authentication::ByCookieToken
  include Authentication::UserAbstraction
  
  has_one :curriculum
  belongs_to :industry
  
  set_inheritance_column :user_type
  validates_presence_of  :user_type
  
  #validates_presence_of :name
  #attr_accessible :login, :email, :name, :password, :password_confirmation, :invitation_token, :last_name, :industry_id, :cep, :professional_description, :avatar
  
  has_attached_file :avatar, :styles => { :thumb => "90x90>", :small => "50x50>", :contact => "36x36" }
  
  def self.member_list(page)
    paginate :all, :per_page => 50, :page => page, :conditions => ['enabled = ? and activated_at IS NOT NULL', true], :order => 'login'
  end
  
  def self.administrative_member_list(page)
    paginate :all, :per_page => 50, :page => page, :order => 'login'
  end
  
  def to_xml(options = {})
    #Add attributes accessible by xml
    #Ex. default_only = [:id, :login, :name]
    default_only = []
    options[:only] = (options[:only] || []) + default_only
    super(options)
  end

end
