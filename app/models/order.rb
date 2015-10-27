class Order < ActiveRecord::Base
	belongs_to :user
	has_many :order_items, :dependent => :destroy


	def paypal_url(return_path)

		# some_item = self.order_items.take

		values = {
				business: 'hi.geoom-facilitator@gmail.com',
				cmd: '_cart',
				upload: 1,
				return: "#{Rails.application.secrets.app_host}#{return_path}",
				invoice: self.id,
				currency_code: 'USD'
		}

		counter = 1
		self.order_items.each do |item|
			values.merge!({
					"item_number_#{counter}" => counter,
					"item_name_#{counter}" => item.model_item.model.name,
					"amount_#{counter}" => item.model_item.price,
					"quantity_#{counter}" => item.quantity
			})
			counter += 1
		end

		"#{Rails.application.secrets.paypal_host}/cgi-bin/webscr?" + values.to_query
	end

end
