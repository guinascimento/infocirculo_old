# == Schema Information
# Schema version: 20090904144307
#
# Table name: messages
#
#  id         :integer(4)      not null, primary key
#  body       :text
#  subject    :string(255)     default("")
#  created_at :datetime        not null
#  updated_at :datetime
#  author_id  :integer(4)
#

class Message < ActiveRecord::Base
	belongs_to :author, :class_name => "User"
	has_many :message_copies
	has_many :recipients, :through => :message_copies
	before_create :prepare_copies
	
	validates_presence_of :author_id
	validates_presence_of :subject
	validates_presence_of :body
	
	attr_accessor  :to # array of people to send to
	attr_accessible :subject, :body, :to

	def prepare_copies
		return if to.blank?

		to.each do |recipient|
			recipient = User.find(recipient)
			message_copies.build(:recipient_id => recipient.id, :folder_id => recipient.inbox.id)
		end
	end
end
