ActiveAdmin.register Model do

	permit_params :name, :description, :type
	belongs_to :product
	navigation_menu :product

	form do |f|
		f.semantic_errors *f.object.errors.keys
		inputs 'Details' do
			input :product, :as => :select, :collection => Product.all
			input :name
			input :description
			input :type, :as => :radio, collection: {
					'T-shirt' => 't-shirt', 'Pullover' => 'p-screwneck', 'Hoodie' => 'p-hoodie'
			}
		end
		actions
	end

	action_item :view, only: :show do
		link_to 'Add item', new_admin_model_model_item_path(model)
	end

	sidebar 'Model Details', only: [:show, :edit] do
		ul do
			li link_to 'List all items', admin_model_model_items_path(model)
		end
	end

end
