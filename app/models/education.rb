# == Schema Information
# Schema version: 20090826183105
#
# Table name: educations
#
#  id               :integer(4)      not null, primary key
#  school_name      :string(255)
#  degree           :integer(4)
#  start            :datetime
#  end              :datetime
#  activities       :string(255)
#  additional_notes :string(255)
#  curriculum_id    :integer(4)
#  country_id       :integer(4)
#  created_at       :datetime
#  updated_at       :datetime
#  studing          :integer(4)
#

class Education < ActiveRecord::Base
  validates_presence_of :country, :school_name, :degree
  validates_presence_of :start
  validates_presence_of :end, :if => Proc.new { |education| education.studing == 0 }

  belongs_to :curriculum
  belongs_to :country

  acts_as_enum :degree, ['2. Grau'.to_sym, '2. Grau Técnico'.to_sym, 'Graduação'.to_sym, 'Pós-graduação'.to_sym, 'Mestrado'.to_sym, 'Doutorado'.to_sym, 'MBA'.to_sym]
end
