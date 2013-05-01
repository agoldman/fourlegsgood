class PetsController < ApplicationController

	respond_to :json

	def index
		@owner_id = params[:owner_id]
		@dog = Pet.find_by_owner_id(@owner_id)
		render json: @dog
	end

end
