class SittingsController < ApplicationController

	respond_to :json

	def index
		@user = User.find(params[:user_id]) #change to current_user
		@sat_for_owners = @user.sat_for_owners
		render json: @sat_for_owners
	end
end
