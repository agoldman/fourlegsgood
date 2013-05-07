class ReceivedMessagesController < ApplicationController

	respond_to :json

	def index
		@user = current_user
		@inbox = @user.inbox
		render json: @inbox
	end

end
