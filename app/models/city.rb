# == Schema Information
# Schema version: 20090807214936
#
# Table name: cities
#
#  id       :integer(4)      not null, primary key
#  name     :string(255)
#  state_id :integer(4)
#

class City < ActiveRecord::Base
  belongs_to :user
end
