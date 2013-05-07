class SentMessagesController < ApplicationController

	respond_to :json

	def index
		@user = current_user
		@sent = @user.sent_messages
		render json: @sent
	end

end
