class SittingsController < ApplicationController

	respond_to :json
	respond_to :html

	def create
		if (!user_signed_in?)
			redirect_to new_user_session_url
		else
			@sitting = Sitting.new
			@sitting.sitter_id = current_user.id
		end
	end

end