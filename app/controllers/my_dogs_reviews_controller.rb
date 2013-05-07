class MyDogsReviewsController < ApplicationController

	respond_to :json

	def index
		@user = current_user
		@reviews_of_my_dogs = @user.reviewsOfMyDogs
		render json: @reviews_of_my_dogs
	end
end
