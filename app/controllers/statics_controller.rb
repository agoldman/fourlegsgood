class StaticsController < ApplicationController

	def index
		if user_signed_in?
			redirect_to user_url(current_user)
		end
	end


end
