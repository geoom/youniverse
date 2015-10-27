class CartsController < ApplicationController
	before_action :authenticate_user!, except: [:hook]

	def show
		@cart_items = current_user.get_current_order.order_items
	end

	def add
		current_order = current_user.get_current_order

		new_item = OrderItem.new
		new_item.model_item = ModelItem.find(params[:item_id])
		new_item.size = params[:size]
		new_item.total_price = new_item.model_item.price * 1  # item price * quantity
		new_item.order = current_order

		if new_item.save
			render json: current_user.cart_count, status: :created
		else
			render json: new_item.errors, status: :unprocessable_entity
		end
	end

	def remove
		# $redis.srem current_user_cart, params[:product_id]
		# render json: current_user.cart_count, status: 200
	end

	def checkout
		redirect_to current_user.get_current_order.paypal_url(cart_path)
	end


	protect_from_forgery except: [:hook]
	def hook
		params.permit! # Permit all Paypal input params

		status = params[:payment_status]
		if status == 'Completed'
			transaction_order = Order.find(params[:invoice])
			Payment.create channel: 'paypal', notification_params: params, status: status,
			               transaction_id: params[:txn_id], purchased_at: Time.now, order: transaction_order
		end
		render nothing: true
	end

end
