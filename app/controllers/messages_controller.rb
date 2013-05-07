class MessagesController < ApplicationController

	respond_to :json

	def index
		@user = current_user #will change to current user when I have login
		@msgHistory = @user.messageHistoryRoots
		render json: @msgHistory
	end

end
