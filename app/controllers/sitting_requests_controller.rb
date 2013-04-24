class SittingRequestsController < ApplicationController

	def index

		@zip = params[:zip]
		@addresses = SittingRequest.geocodedAddresses  #inefficient. should filter for distance before gc-ing?
		@sitting_requests = SittingRequest.Requested

	end
end
