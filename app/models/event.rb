# == Schema Information
# Schema version: 20090826183105
#
# Table name: events
#
#  id        :integer(4)      not null, primary key
#  name      :string(255)
#  starts_at :datetime
#  ends_at   :datetime
#

class Event < ActiveRecord::Base
end
