class CurrentRequestsController < ApplicationController

	respond_to :json

	def index
		# @user = User.find(params[:user_id]) #will change to current user when I have login
		@address = (params[:address])
		@near_by_users = User.near(@address, 20)
		@near_by_ids = []
		@near_by_users.each do |user|
			@near_by_ids << user.id 
		end

		@current_requests = SittingRequest.where(owner_id: @near_by_ids, status: 'requested')

		render json: @current_requests
	end

end
