class Curriculum < ActiveRecord::Base
  #validates_presence_of :summary

  belongs_to :user
  has_many :experiences
  has_many :educations

  acts_as_enum :maritial_status, [:Solteiro, :Casado, :Divorciado]
end
