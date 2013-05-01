class CurrentRequestsController < ApplicationController

	respond_to :json

	def index
		@user = User.find(params[:user_id]) #will change to current user when I have login
		@current_requests = @user.current_requests(params[:latlng])
		render json: @current_requests
	end

end
