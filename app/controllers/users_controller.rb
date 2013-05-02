class UsersController < ApplicationController

	respond_to :json
	respond_to :html, only: [:show]

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])  #with login this will change to current_user

		respond_to do |format|
			format.html { render :show }
			format.json { render json: @user }
		end
	end

	def new 
		@user = User.first
	end

	def create
		@user = User.new(params[:user])
		if @user.save
		#	login
			UserMailer.welcome_email(@user).deliver
			flash[:succes] = "Thank you for signing up!"
			redirect_to user_url(@user)
		else
			flash[:error] = "Try Again, Please"
			p "no"
			render :new
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
