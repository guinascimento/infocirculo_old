# == Schema Information
# Schema version: 20090826183105
#
# Table name: curriculums
#
#  id              :integer(4)      not null, primary key
#  summary         :string(10000)
#  phone           :string(255)
#  im              :string(255)
#  im_type         :integer(4)
#  address         :string(255)
#  birthday        :string(255)
#  maritial_status :integer(2)
#  user_id         :integer(4)
#  created_at      :datetime
#  updated_at      :datetime
#

class Curriculum < ActiveRecord::Base
  #validates_presence_of :phone, :on => :update
  #validates_numericality_of :phone, :on => :update
  #validates_presence_of :address, :on => :update
  validates_presence_of :im_type, :if => Proc.new { |curriculum| curriculum.im != nil }, :on => :update
  #validates_presence_of :maritial_status, :on => :update
  validates_presence_of :summary, :on => :update

  belongs_to :user
  has_many :experiences
  has_many :educations
  has_many :idioms

  acts_as_enum :maritial_status, [:Solteiro, :Casado, :Divorciado]
  acts_as_enum :im_type, [:MSN, :AIM, :GTalk, :Skype]
end
