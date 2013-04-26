class MessagesController < ApplicationController

	respond_to :json
	respond_to :html

	def index
		@user = User.find(params[:user_id]); #will change to current user when I have login
		@receivedMsgs = @user.received_messages
		
		respond_to do |format|
			format.html { render :index }
			format.json { render json: @receivedMsgs }
		end
	end

end
