class Education < ActiveRecord::Base
  validates_presence_of :school_name
  validates_uniqueness_of :school_name

  belongs_to :curriculum
end
