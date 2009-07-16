# == Schema Information
# Schema version: 20090706173053
#
# Table name: educations
#
#  id               :integer(4)      not null, primary key
#  country          :integer(4)
#  school_name      :string(255)
#  degree           :integer(4)
#  start            :datetime
#  end              :datetime
#  activities       :string(255)
#  additional_notes :string(255)
#  curriculum_id    :integer(4)
#  created_at       :datetime
#  updated_at       :datetime
#

class Education < ActiveRecord::Base
  validates_presence_of :school_name
  validates_uniqueness_of :school_name

  belongs_to :curriculum
end
