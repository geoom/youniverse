class StaticPagesController < ApplicationController
  def home
	  @products = Product.where(published: true).order(created_at: :desc)
  end
end
