# == Schema Information
# Schema version: 20090826183105
#
# Table name: mail
#
#  id              :integer(4)      not null, primary key
#  user_id         :integer(4)      not null
#  message_id      :integer(4)      not null
#  conversation_id :integer(4)
#  read            :boolean(1)
#  trashed         :boolean(1)
#  mailbox         :string(25)
#  created_at      :datetime        not null
#

class Mail < ActiveRecord::Base
  self.table_name = "mail"
  belongs_to :message
  belongs_to :user
  belongs_to :conversation
  
  #sets the read attribute of the mail message to true.
  def mark_as_read()
    update_attribute('read', true)
  end
  
  #sets the read attribute of the mail message to false.
  def mark_as_unread()
    update_attribute('read', false)
  end
end
