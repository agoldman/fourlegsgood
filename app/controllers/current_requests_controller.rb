class CurrentRequestsController < ApplicationController

	respond_to :json
	respond_to :html

	def index
		if (params[:start] && params[:end])
			@address = params[:address]
			@start = DateTime.parse(params[:start])
			@end = DateTime.parse(params[:end])

			@all = User.all

			p p"all users"
			p @all

			@near_by_users = User.near(@address, 100)

			p "near_by_users"
			p @near_by_users

			@near_by_ids_any_status = []
			@near_by_request_info = []
			@near_by_users.each do |user|
				@near_by_ids_any_status << user.id 
			end

			@current_requests = SittingRequest.where(owner_id: @near_by_ids_any_status, status: 'requested')
											  .where("start_date >= ?", @start)
											  .where("end_date <= ?", @end)

			p "current_requests"
			p @current_requests

			@near_by_ids_requested_status = [];
			@current_requests.each do |request|
				@near_by_ids_requested_status << request.owner_id 
			end

			@current_request_users = User.where(id: @near_by_ids_requested_status)

			p "current_request_users"
			p @current_request_users

			@current_request_users.each do |user|
				@near_by_request_info << [user.latitude, user.longitude, user.id, user.address, user.name]
			end


			render json: @near_by_request_info


		else
			# @user = User.find(params[:user_id]) #will change to current user when I have login

			@address = (params[:address])
			@near_by_users = User.near(@address, 100)
			@all = User.all
			p"all users"
			p @all

			p "near_by_users"
			p @near_by_users
			
			@near_by_ids_any_status = []
			@near_by_request_info = []
			@near_by_users.each do |user|
				@near_by_ids_any_status << user.id 
			end

			@current_requests = SittingRequest.where(owner_id: @near_by_ids_any_status, status: 'requested')

			p "current_requests"
			p @current_requests

			@near_by_ids_requested_status = [];
			@current_requests.each do |request|
				@near_by_ids_requested_status << request.owner_id 
			end

			@current_request_users = User.where(id: @near_by_ids_requested_status)

			p "current_request_users"
			p @current_request_users


			@current_request_users.each do |user|
				s = SittingRequest.where("owner_id = ?", user.id)
				@near_by_request_info << [user.latitude, user.longitude, user.id, user.address, user.name, s[0].id]
			end
			#debugger
			render json: @near_by_request_info
		end

	end


	def new
		unless user_signed_in?
			redirect_to new_user_session_url
		end
		@request = SittingRequest.new
		@user = current_user
	end

	def create
		@request = SittingRequest.new
		@request.owner_id = current_user.id
		@start = params[:start]
		@end = DateTime.parse(@start) + params[:nights].to_i
		@request.start_date = @start
		@request.end_date = @end
		@status = 'requested'  
		if @request.save  #add errors flash
			redirect_to user_url(current_user)
			current_user.swaps_earned = current_user.swaps_earned - params[:nights].to_i
			current_user.save
		else
			render :new
		end
	end

	def show
		@request = SittingRequest.find(params[:id])
	end

	def active
		@active_requests = current_user.current_requests
	end

end
