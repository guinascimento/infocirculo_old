class SentController < ApplicationController

  def index
    @messages = current_user.sent_messages.paginate :per_page => 10, :page => params[:page], :order => "created_at DESC"
    @folder = current_user.inbox
    puts "|||| " + @messages.inspect.to_s
  end

  def show
    @message = current_user.sent_messages.find(params[:id])
  end

  def new
    @message = current_user.sent_messages.build
  end

  def create
    @message = current_user.sent_messages.build(params[:message])

    if @message.save
      flash[:notice] = "Mensagem enviada com sucesso."
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end
end
