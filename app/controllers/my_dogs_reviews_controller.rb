class MyDogsReviewsController < ApplicationController

	respond_to :json

	def index
		@user = User.find(params[:user_id]) #change to current user
		@reviews_of_my_dogs = @user.reviewsOfMyDogs
		render json: @reviews_of_my_dogs
	end
end
