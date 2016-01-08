class StaticPagesController < ApplicationController
	def home

		@products = Product.where(published: true).order(created_at: :desc)

	end

	def about
	end

	def tos
	end

	def privacy
	end
end
