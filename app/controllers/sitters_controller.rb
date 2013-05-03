class SittersController < ApplicationController

	respond_to :json

	def index
		@user = User.find(params[:user_id]) #change to current_user
		@sitters_ids_hash = @user.sittersofOccurredSitting
		@sitter_ids = []
		@sitters_ids_hash.each do |el|
			@sitter_ids<<el["id"]
		end
		@sitters = User.where(id: @sitter_ids)
		render json: @sitters
	end
end
