Rails.application.configure do
	config.action_mailer.smtp_settings = {
			:address   => 'smtp.mandrillapp.com',
			:port      => 587,
			:enable_starttls_auto => true,
			:user_name => ENV['MANDRILL_USERNAME'],
				:password  => ENV['MANDRILL_API_KEY'],
			:authentication => 'login',
			:domain => 'youniverse.club'
	}

	config.action_mailer.default_url_options = { host: 'smtp.mandrillapp.com' }
end