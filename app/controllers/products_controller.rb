class ProductsController < ApplicationController

	# GET /products/1
	def show
		@product = Product.find(params[:id])
		@cart_action = @product.cart_action current_user.try :id
	end

	private
	def product_params
		params.require(:product).permit(:name, :description, :design_image, :published)
	end
end
