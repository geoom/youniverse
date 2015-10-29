class OrdersController < ApplicationController
	before_action :authenticate_user!
	before_action :set_order, only: [:payment]

	def payment
		@payment = @order.payment
	end

	private
	def set_order
		@order = Order.find(params[:id])
	end
end
