class MessagesController < ApplicationController
	def index
		@messages = Message.all
	end

	def new 
  		@message = Message.new 
	end

	def create 
  		@message = Message.new(message_params) 
  		if @message.save 
   			redirect_to '/messages' 
  		else 
    		render 'new' 
  		end 
	end

  def delete
      @message = Message.find(params[:id])
      @messages.delete(@message)
  end

	private 
  		def message_params 
    		params.require(:message).permit(:content) 
  		end
end
