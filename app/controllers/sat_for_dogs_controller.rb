class SatForDogsController < ApplicationController

	respond_to :json

	def index
		@user = User.find(params[:user_id]) #change to current_user
		@sat_for_dogs = @user.satForDogs
		render json: @sat_for_dogs
	end
end
