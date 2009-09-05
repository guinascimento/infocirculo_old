# == Schema Information
# Schema version: 20090904144307
#
# Table name: experiences
#
#  id            :integer(4)      not null, primary key
#  company_name  :string(255)
#  title         :string(255)
#  start         :datetime
#  end           :datetime
#  description   :string(1000)
#  curriculum_id :integer(4)
#  created_at    :datetime
#  updated_at    :datetime
#  working       :integer(4)
#

class Experience < ActiveRecord::Base
  validates_presence_of :company_name, :title, :description
  validates_presence_of :start
  validates_presence_of :end, :if => Proc.new { |experience| experience.working == 0 }

  belongs_to :curriculum
end
