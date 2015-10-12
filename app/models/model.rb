class Model < ActiveRecord::Base
	belongs_to :product
	has_many :model_items

	def to_s
		"#{product.name}: #{name}"
	end
end
