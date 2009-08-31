# == Schema Information
# Schema version: 20090826183105
#
# Table name: idioms
#
#  id            :integer(4)      not null, primary key
#  degree        :integer(3)
#  name          :string(255)
#  curriculum_id :integer(4)
#  created_at    :datetime
#  updated_at    :datetime
#

class Idiom < ActiveRecord::Base
  validates_presence_of :name, :degree

  acts_as_enum :degree, ['Fluente'.to_sym, 'Intermediário'.to_sym, 'Básico'.to_sym]
end
