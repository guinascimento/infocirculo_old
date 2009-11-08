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
    begin
      #@messages = current_user.received_messages.find(params[:message])
      @messages = current_user.received_messages.find(params[:message])
      @messages.each do |m|
        m.update_attribute("deleted", true)
      end
      if @messages.size == 1
        flash[:notice] = "Mensagem removida com sucesso."  
      else
        flash[:notice] = "Mensagens removidas com sucesso."
      end
    rescue ActiveRecord::RecordNotFound
      flash[:error] = "Selecione uma mensagem."
    end
    redirect_to :controller => "mailbox", :action => "index"
  end
end
