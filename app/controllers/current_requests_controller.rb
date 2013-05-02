class CurrentRequestsController < ApplicationController

	respond_to :json
	respond_to :html

	def index
		if (params[:start] && params[:end])
			@address = params[:address]
			@start = params[:start]
			@end =params[:end]
			p "start" + @start
			p "end" + @end
			@near_by_users = User.near(@address, 100)
			@near_by_ids_any_status = []
			@near_by_request_info = []
			@near_by_users.each do |user|
				@near_by_ids_any_status << user.id 
			end

			@current_requests = SittingRequest.where(owner_id: @near_by_ids_any_status, status: 'requested').where("start_date >= date('" + @start + "')").where("end_date <= date('" + @end + "')")

			@near_by_ids_requested_status = [];
			@current_requests.each do |request|
				@near_by_ids_requested_status << request.owner_id 
			end

			@current_request_users = User.where(id: @near_by_ids_requested_status)
			@current_request_users.each do |user|
				@near_by_request_info << [user.latitude, user.longitude, user.id, user.address, user.user_name]
			end


			render json: @near_by_request_info


		else
			# @user = User.find(params[:user_id]) #will change to current user when I have login
			@address = (params[:address])
			@near_by_users = User.near(@address, 100)
			@near_by_ids_any_status = []
			@near_by_request_info = []
			@near_by_users.each do |user|
				@near_by_ids_any_status << user.id 
			end

			@current_requests = SittingRequest.where(owner_id: @near_by_ids_any_status, status: 'requested')
			@near_by_ids_requested_status = [];
			@current_requests.each do |request|
				@near_by_ids_requested_status << request.owner_id 
			end

			@current_request_users = User.where(id: @near_by_ids_requested_status)
			@current_request_users.each do |user|
				@near_by_request_info << [user.latitude, user.longitude, user.id, user.address, user.user_name]
			end

			render json: @near_by_request_info
		end

	end

end
