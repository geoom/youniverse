class SubscribeUserToMailingListJob < ActiveJob::Base
	queue_as :default

	def perform(user)
		logger.info "signing up #{user.email}"
		if user.email
			subscribe(user.name, user.email)
		else
			logger.warn "#{user.name} cannot be suscribed because he hasn't email"
		end
	end


	def subscribe(name, email)

		mailchimp_request = Gibbon::Request.new
		list_id = ENV['MAILCHIMP_USERS_LIST_ID']

		begin
			result = mailchimp_request.lists(list_id).members.create(
					body: {
							email_address: email,
							status: 'subscribed',
							merge_fields: {FNAME: name}
					})
			logger.info "Subscribed #{user.email} to MailChimp" if result
		rescue Gibbon::MailChimpError => e
			logger.error "#{email} couldn't be subscribed: #{e.detail}"
		end

	end
end
