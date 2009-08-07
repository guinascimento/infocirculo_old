# == Schema Information
# Schema version: 20090807214936
#
# Table name: states
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class State < ActiveRecord::Base
end
