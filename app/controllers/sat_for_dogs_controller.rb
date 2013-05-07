class SatForDogsController < ApplicationController

	respond_to :json

	def index
		@user = current_user
		@sat_for_dog_ids_hash = @user.satForDogs
		@dog_ids = []
		@sat_for_dog_ids_hash.each do |el|
			@dog_ids<<el["id"]
		end
		@dogs = Pet.where(id: @dog_ids)
		render json: @dogs
	end
end
