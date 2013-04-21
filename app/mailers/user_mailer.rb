class UserMailer < ActionMailer::Base
  default from: "Four Legs Good <welcome@fourlegsgoodsf.com>" #get email address

	def welcome_email(user)
		@user = user
		@url = 'http://fourlegsgoodsf.com/users/new' #alias this to login
		mail(to: user.email, subject: 'Welcome to Four Legs Good SF')
	end

	def new_notification_email(user)
		
	end


end

