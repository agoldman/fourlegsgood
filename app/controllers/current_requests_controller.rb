class CurrentRequestsController < ApplicationController

	respond_to :json

	def index
		# @user = User.find(params[:user_id]) #will change to current user when I have login
		@address = (params[:address])
		@near_by_users = User.near(@address, 50)
		@near_by_ids = []
		@near_by_request_info = []
		@current_dogs = []
		@near_by_users.each do |user|
			@near_by_ids << user.id 
		end

		@current_requests = SittingRequest.where(owner_id: @near_by_ids, status: 'requested')
		@current_requests.each do |request|
			@near_by_ids = request.owner_id 
		end

		@current_request_users = User.where(id: @near_by_ids)
		@current_dogs = Pet.where(owner_id: @near_by_ids)
		@current_request_users.each do |user|
			@near_by_request_info << [user.latitude, user.longitude, user.id, user.address, user.user_name]
		end


		render json: @near_by_request_info
	end

end
