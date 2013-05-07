class OtherDogsReviewsController < ApplicationController

	respond_to :json

	def index
		@user = current_user
		@otherdogsreviews = @user.reviewsOfOtherDogs
		render json: @otherdogsreviews
	end
end
