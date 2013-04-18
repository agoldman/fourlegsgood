class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def new 
		@user = User.new
	end

	def create
		p "no"
		@user = User.new(params[:user])
		if @user.save
		#	login
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
