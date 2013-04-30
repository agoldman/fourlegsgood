class OtherSittersReviewsController < ApplicationController

	respond_to :json

	def index
		@user = User.find(params[:user_id]) #change to current user
		@othersittersreviews = @user.reviewsOfOtherSitters
		render json: @othersittersreviews
	end
end
