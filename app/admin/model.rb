ActiveAdmin.register Model do

	permit_params :name
	belongs_to :product
	navigation_menu :product

end
