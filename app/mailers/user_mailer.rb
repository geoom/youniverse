class UserMailer < ApplicationMailer

	def welcome_email(user)
		logger.info "sending welcome email to #{user.email}"
		@user = user
		mail(to: @user.email, subject: "Welcome to Youniverse!")
	end
end
