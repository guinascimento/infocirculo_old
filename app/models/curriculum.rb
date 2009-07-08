class Curriculum < ActiveRecord::Base
  #validates_presence_of :summary
  validates_presence_of :im_type

  belongs_to :user
  has_many :experiences
  has_many :educations

  acts_as_enum :maritial_status, [:Solteiro, :Casado, :Divorciado]
  acts_as_enum :im_type, [:MSN, :AIM, :Skype, :GTalk]
end
