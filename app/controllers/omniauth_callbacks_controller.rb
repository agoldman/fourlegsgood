class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    facebook_data = request.env["omniauth.auth"]
    @user = User.find_or_create_by_facebook_oauth(facebook_data)

	if @user.persisted?
	    sign_in_and_redirect @user, :event => :authentication
	else
		session["devise.facebook_data"] = request.env["omniauth.auth"]
		redirect_to new_user_registration_url
		#add flash
	end
  end
end