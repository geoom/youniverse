class UserMailer < ApplicationMailer

	def welcome_email(user)
		logger.info "sending welcome email to #{user.email}"
		@user = user
		mail(to: @user.email, subject: 'Bienvenido a Youniverse!')
	end

	def send_welcome(user)
		subject = 'Bienvenido a Youniverse!'
		merge_vars = {
				'FNAME' => user.name,
		}
		body = mandrill_template('welcome user', merge_vars)

		send_mail(user.email, subject, body)
	end
end
