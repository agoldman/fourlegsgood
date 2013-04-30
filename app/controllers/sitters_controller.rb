class SittersController < ApplicationController

	respond_to :json

	def index
		@user = User.find(params[:user_id]) #change to current_user
		@sitters = @user.sat_for_owners
		render json: @sitters
	end
end
