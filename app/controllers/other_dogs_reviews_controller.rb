class OtherDogsReviewsController < ApplicationController

	respond_to :json

	def index
		@user = User.find(params[:user_id]) #change to current user
		@otherdogsreviews = @user.reviewsOfOtherDogs
		render json: @otherdogsreviews
	end
end
