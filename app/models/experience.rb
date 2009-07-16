# == Schema Information
# Schema version: 20090706173053
#
# Table name: experiences
#
#  id            :integer(4)      not null, primary key
#  company_name  :string(255)
#  title         :string(255)
#  start         :datetime
#  end           :datetime
#  description   :string(255)
#  curriculum_id :integer(4)
#  created_at    :datetime
#  updated_at    :datetime
#

class Experience < ActiveRecord::Base
  belongs_to :curriculum
end
