class OmniauthSessionsController < Devise::OmniauthCallbacksController

	skip_before_filter :authenticate_user!

	def create

		# raise :test

		user = User.find_or_create_from_auth_hash(request.env['omniauth.auth'], current_user)

		if user.persisted?
			# flash[:notice] = "You are in..!!! Go to edit profile to see the status for the accounts"
			sign_in_and_redirect(user)
		else
			session["devise.user_attributes"] = user.attributes
			redirect_to new_user_registration_url
		end

	end

	alias_method :twitter, :create
	alias_method :facebook, :create

end