class PetsController < ApplicationController

	respond_to :json

	def index

		if(params[:user_id])
			@owner_id = params[:user_id]
			@dog = Pet.find_by_owner_id(@owner_id)
			render json: @dog
		else
			@owner_id = params[:owner_id]
			@dog = Pet.find_by_owner_id(@owner_id)
			p @dog
			render json: @dog
		end
	end

end
