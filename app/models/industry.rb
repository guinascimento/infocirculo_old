# == Schema Information
# Schema version: 20090807214936
#
# Table name: industries
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Industry < ActiveRecord::Base
  has_one :user
end
