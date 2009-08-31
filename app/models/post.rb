# == Schema Information
# Schema version: 20090826183105
#
# Table name: posts
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  title      :string(255)
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#

class Post < ActiveRecord::Base

end
