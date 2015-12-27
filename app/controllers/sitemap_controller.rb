class SitemapController < ApplicationController
	respond_to :xml

	def index
		@static_pages = [home_url, about_url, privacy_url, tos_url, new_request_url]
		# @products = Product.order('created_at DESC')
	end
end
