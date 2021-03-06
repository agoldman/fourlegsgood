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
		@light_nav = true
		@user = User.find(params[:id])  #user profile's are private!
		if(current_user.id == @user.id)
			respond_to do |format|
				format.html { render :show }
				format.json { render json: @user }
			end
		else
			redirect_to user_url(current_user) #sending you to your own site for now. want to show the "other-user" view eventually
		end
	end

	def edit
		@user = current_user
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(params["user"])
			flash[:success] = "Thanks for updating your profile!"
			redirect_to user_url(@user)
		else
			flash[:error] = "Please try again"
			render :json => @user.errors.full_messages
		end
	end

	def verify
		@verification = rand(10).to_s 
    	5.times do
        	@verification += rand(10).to_s 
     	end
     	@phone = params[:phone]
     	if (current_user.verify(@phone, @verification))
     		render json: @phone
     	else
     		render status: 422
     	end
	end

	def confirm
		@user_code = params[:code]
		@phone = params[:phone]
		@confirmation = current_user.confirm(@user_code)
		if (@confirmation)
			current_user.phone_number = @phone
			if(current_user.save!)
				render json: @confirmation
			end
		end
		
	end

end
