# == Schema Information
# Schema version: 20090904144307
#
# Table name: countries
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Country < ActiveRecord::Base

end
