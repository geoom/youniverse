class OrderItem < ActiveRecord::Base
  belongs_to :model_item
  belongs_to :order
end
