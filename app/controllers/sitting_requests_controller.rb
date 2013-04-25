class SittingRequestsController < ApplicationController

	respond_to :html
	respond_to :json

	def index

		@zip = params[:zip]
		@addresses = SittingRequest.geocodedAddresses  #inefficient. should filter for distance before gc-ing?
		@sitting_requests = SittingRequest.Requested

	end
end
