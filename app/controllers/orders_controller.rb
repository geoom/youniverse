class OrdersController < ApplicationController
	before_action :authenticate_user!
	before_action :set_order, only: [:payment]

	def index
		@orders = []
		current_user.orders.where(is_archived: true).each do |order|
			@orders.push order if order.has_payment?
		end
	end

	def payment
		@payment = @order.payment
	end

	private
	def set_order
		@order = Order.find(params[:id])
	end
end
