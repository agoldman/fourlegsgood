class UsersController < ApplicationController

	respond_to :json
	respond_to :html, only: [:show]

	def index
		@users = User.all
	end

	def new 
		@user = User.first
	end

	def show
		@user = User.find(params[:id])  #user profile's are private!
		if(current_user.id == @user.id)
			respond_to do |format|
				format.html { render :show }
				format.json { render json: @user }
			end
		else
			redirect_to user_url(current_user)
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes
			flash[:success] = "Thanks for updating your profile!"
			redirect_to user_url(@user)
		else
			flash[:error] = "Please try again"
			render :edit
		end
	end

end
