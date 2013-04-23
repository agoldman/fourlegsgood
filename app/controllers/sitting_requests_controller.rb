class SittingRequestsController < ApplicationController

	def index
		@zip = params[:zip]
		@sitting_requests = SittingRequest.Requested
	end
end
