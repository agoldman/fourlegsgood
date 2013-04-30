class SittersController < ApplicationController

	respond_to :json

	def index
		@user = User.find(params[:user_id]) #change to current_user
		@sitters = @user.sittersofOccurredSitting
		render json: @sitters
	end
end
