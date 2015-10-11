class Model < ActiveRecord::Base
	belongs_to :product
	has_many :model_items
end
