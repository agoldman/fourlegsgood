class SittingRequestsController < ApplicationController

	respond_to :html
	respond_to :json

	def index
		@zip = params[:zip]
	end
end
