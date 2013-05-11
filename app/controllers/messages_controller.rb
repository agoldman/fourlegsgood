class MessagesController < ApplicationController

	respond_to :json
	respond_to :html

	def index
		@user = current_user #will change to current user when I have login
		@msgHistory = @user.messageHistoryRoots
		render json: @msgHistory
	end

	def new
		fail
		@message = Message.new
	end

end
