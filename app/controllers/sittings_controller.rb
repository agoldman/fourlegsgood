class SittingsController < ApplicationController

	respond_to :html

	def create
		if (!user_signed_in?)
			redirect_to new_user_session_url
		else
			@sitting = Sitting.new
			@sitting.sitter_id = current_user.id
			@request = SittingRequest.find(params[:sitting_request][:id])
			@sitting.start_date = @request.start_date
			@sitting.end_date = @request.end_date
			@sitting.status = 'offered'
			@sitting.sat_for_owner_id = @request.owner_id
			@sitting.save # add check for success here
			redirect_to current_request_url(@request.id)
		end
	end

end