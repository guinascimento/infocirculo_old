# == Schema Information
# Schema version: 20090904144307
#
# Table name: message_copies
#
#  id           :integer(4)      not null, primary key
#  recipient_id :integer(4)
#  message_id   :integer(4)
#  folder_id    :integer(4)
#  created_at   :datetime
#  updated_at   :datetime
#

class MessageCopy < ActiveRecord::Base
	belongs_to :message
	belongs_to :recipient, :class_name => "User"
	belongs_to :folder
	delegate   :author, :created_at, :subject, :body, :recipients, :to => :message
	scope_out  :deleted
  	scope_out  :not_deleted, :conditions => ["deleted IS NULL OR deleted = ?", false]
end
