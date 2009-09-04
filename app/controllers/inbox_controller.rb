class InboxController < ApplicationController
	def index
		@me = User.find(2)
		@mail = @me.mailbox[:inbox].unread_mail
	end
	
	def view
		@me = User.find(1)
		@mail = @me.mailbox[:inbox].unread_mail
	end
	
	def new
		respond_to do |format|
			format.html
		end
	end
	
	def remove
	ids = params[:id]
	puts "->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> " + ids.inspect
		for m in ids
			message = Message.find(m)
			message.destroy
		end
		#@message = Message.find(params[:id])
		#puts @message.inspect
		#if @idiom.destroy
		#	flash[:notice] = "Mensagem excluída com sucesso."
		#end
	end
	
	def send_email
		admin = User.find(1)

		me = User.find(current_user.id)
		me.send_message(admin, params[:body], params[:subject])

		#flash[:notice] = "Mensagem enviada com sucesso."
		render :action => 'index'
	end
end
