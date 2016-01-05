class StaticPagesController < ApplicationController
	def home

		@products = Product.where(published: true).order(created_at: :desc)

		# person1 = { :name => "Joe", :age => 35, :job => "plumber" }
		#
		# person2 = { :name => "Martin", :age => 35, :job => "plumber" }
		#
		# person3 = { :name => "George", :age => 35, :job => "plumber" }
		#
		# @persons = [person1, person2, person3]

	end

	def about
	end

	def tos
	end

	def privacy
	end
end
