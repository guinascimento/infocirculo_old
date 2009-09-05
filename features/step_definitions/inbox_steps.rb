Given /^I have 1 message with subject "([^\"]*)" and body "([^\"]*)"$/ do |subject, body|
	@message = @user.sent_messages.build(:subject => subject, :body => body, :author_id => 2, :to => [@user.id])
	@message.save
end