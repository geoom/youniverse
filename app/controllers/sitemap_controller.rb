class SitemapController < ApplicationController
	respond_to :xml

	def index
		@static_pages = [home_url]
		@products = Product.order("created_at DESC")
	end
end
