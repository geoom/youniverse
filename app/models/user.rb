class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	       :recoverable, :rememberable, :trackable, :validatable, :omniauthable

	validates_presence_of :email
	has_many :authorizations
	has_many :requests
	has_many :orders

	def self.new_with_session(params, session)
		if session["devise.user_attributes"]
			new(session["devise.user_attributes"], without_protection: true) do |user|
				user.attributes = params
				user.valid?
			end
		else
			super
		end
	end

	def self.find_or_create_from_auth_hash(auth, current_user)
		authorization = Authorization.where(:provider => auth.provider, :uid => auth.uid.to_s, :token => auth.credentials.token, :secret => auth.credentials.secret).first_or_initialize
		if authorization.user.blank?
			user = current_user || User.where('email = ?', auth["info"]["email"]).first
			if user.blank?
				user = User.new
				user.password = Devise.friendly_token[0, 10]
				user.name = auth.info.name
				user.email = auth.info.email
				if auth.provider == "twitter"
					user.save(:validate => false)
				else
					user.save
				end
			end
			authorization.username = auth.info.nickname
			authorization.user_id = user.id
			authorization.save
		end
		authorization.user
	end

	def cart_count
		get_current_order.order_items.count
	end

	def get_current_order
		if Order.where(user_id: self.id, is_archived: false).count < 2
			Order.find_or_create_by(user: self, is_archived:false) do |order|
				order.user = self
			end
		else
			Order.where(user_id: self.id, is_archived: false).last  # take the last created order
		end
	end

end
