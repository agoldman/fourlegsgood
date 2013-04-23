class SittingRequestsController < ApplicationController

	def index
		@sitting_requests = SittingRequest.Requested
	end
end
