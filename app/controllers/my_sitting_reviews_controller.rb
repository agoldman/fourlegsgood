class MySittingReviewsController < ApplicationController

	respond_to :json

	def index
		@user = current_user
		@sittingreviews = @user.reviewsOfMySitting
		render json: @sittingreviews
	end
end
