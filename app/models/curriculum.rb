class Curriculum < ActiveRecord::Base
  validates_presence_of :im_type, :if => Proc.new { |curriculum| curriculum.im != "" }

  belongs_to :user
  has_many :experiences
  has_many :educations

  acts_as_enum :maritial_status, [:Solteiro, :Casado, :Divorciado]
  acts_as_enum :im_type, [:MSN, :AIM, :GTalk, :Skype]
end
