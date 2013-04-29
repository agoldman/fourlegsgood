class SentMessagesController < ApplicationController

	respond_to :json

	def index
		@user = User.find(params[:user_id]); #will change to current user when I have login
		@sent = @user.sent_messages
		render json: @sent
	end

end
