require 'digest/sha1'

class User < ActiveRecord::Base  
	include Authentication
	include Authentication::ByCookieToken
	include Authentication::UserAbstraction

    has_one :curriculum
    belongs_to :industry

	set_inheritance_column :user_type
	validates_presence_of  :user_type

    validates_presence_of :name
  
	attr_accessible :login, :email, :name, :password, :password_confirmation, :invitation_token, :last_name, :avatar, :industry_id, :cep, :professional_description
  
	has_attached_file :avatar, :styles => { :medium => "400x400>", :thumb => "100x100>" }

	def self.member_list(page)
		paginate :all,
				 :per_page => 50, :page => page,
        		 :conditions => ['enabled = ? and activated_at IS NOT NULL', true],
        		 :order => 'login'
	end

	def self.administrative_member_list(page)
		paginate :all,
						 :per_page => 50, :page => page,
        		 :order => 'login'
	end

	def to_xml(options = {})
		#Add attributes accessible by xml
  	#Ex. default_only = [:id, :login, :name]
		default_only = []
  	options[:only] = (options[:only] || []) + default_only
  	super(options)
  end

end
