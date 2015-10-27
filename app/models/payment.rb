class Payment < ActiveRecord::Base
	belongs_to :order

	serialize :notification_params, Hash
end
