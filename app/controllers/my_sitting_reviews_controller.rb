class MySittingReviewsController < ApplicationController

	respond_to :json

	def index
		@user = User.find(params[:user_id]) #change to current user
		@sittingreviews = @user.reviewsOfMySitting
		render json: @sittingreviews
	end
end
