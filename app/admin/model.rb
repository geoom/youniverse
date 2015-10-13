ActiveAdmin.register Model do

	permit_params :name, :description, :published, :sort
	actions :all, except: [:destroy]
	belongs_to :product
	navigation_menu :product


	index do
		selectable_column
		column :name
		column :description
		column :sort do |model|
			if model.sort == 't-shirt'
				content_tag(:span, 'T-shirt')
			elsif model.sort == 'p-crewneck'
				content_tag(:span, 'Pullover')
			elsif model.sort == 'p-hoddie'
				content_tag(:span, 'Hoodie')
			elsif model.sort == 'tank'
				content_tag(:span, 'tank')
			else
				content_tag(:span, 'unknown')
			end
		end
		column :published
		column :created_at
		actions
	end

	form do |f|
		f.semantic_errors *f.object.errors.keys
		inputs 'Details' do
			input :product, :as => :select, :collection => Product.all
			input :name
			input :description
			input :published
			input :sort, :as => :radio, collection: {
					'T-shirt' => 't-shirt', 'Pullover' => 'p-crewneck', 'Hoodie' => 'p-hoodie', 'Tank' => 'tank'
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
