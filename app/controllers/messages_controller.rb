class MessagesController < ApplicationController

	respond_to :json

	def index
		@user = User.find(params[:user_id]) #will change to current user when I have login
		@msgHistory = @user.messageHistoryRoots
		render json: @msgHistory
	end

end
