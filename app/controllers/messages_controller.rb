class MessagesController < ApplicationController
  
  def show
    @message = current_user.received_messages.find(params[:id])
    @message.update_attribute(:read, 1)
  end
  
  def reply
    @original = current_user.received_messages.find(params[:id])

    subject = @original.subject.sub(/^(Re: )?/, "Re: ")
    body = @original.body.gsub(/^/, "> ")
    @message = current_user.sent_messages.build(:to => [@original.author.id], :subject => subject, :body => body)
    render :template => "sent/new"
  end
  
  def destroy
    puts params[:message]
    @messages = current_user.received_messages.find(params[:message])

    @messages.each do |m|
      puts m.inspect
      m.destroy
    end
    #redirect_to inbox_path
  end
end
