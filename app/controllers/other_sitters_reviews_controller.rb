class OtherSittersReviewsController < ApplicationController

	respond_to :json

	def index
		@user = current_user
		@othersittersreviews = @user.reviewsOfOtherSitters
		render json: @othersittersreviews
	end
end
