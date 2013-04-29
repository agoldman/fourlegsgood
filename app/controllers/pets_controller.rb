class PetsController < ApplicationController

	respond_to :json

	def index
		@user = User.find(params[:user_id]) #will change to current user after login
		@pets = @user.pets
		render json: @pets
	end

end
