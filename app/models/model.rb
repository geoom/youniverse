class Model < ActiveRecord::Base

	belongs_to :product
	has_many :model_items, :dependent => :destroy
	TYPE_OPTIONS = %w[t-shirt p-crewneck p-hoodie tank]

	validates :name, presence: true, uniqueness: true
	validates :description, presence: true, length: {
			minimum: 2,
			maximum: 200,
			too_short: 'must have at least %{count} words',
			too_long: 'must have at most %{count} words'
	}
	validates :sort, presence: true, inclusion: { in: TYPE_OPTIONS }

	def to_s
		"#{product.name}: #{name}"
	end
end
