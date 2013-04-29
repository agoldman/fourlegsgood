class ReceivedMessagesController < ApplicationController

	respond_to :json

	def index
		@user = User.find(params[:user_id]); #will change to current user when I have login
		@inbox = @user.inbox
		render json: @inbox
	end

end
