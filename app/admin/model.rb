ActiveAdmin.register Model do

	permit_params :name, :description, :type
	belongs_to :product

	action_item :view, only: :show do
		link_to 'Add item', new_admin_model_model_item_path(model)
	end

	sidebar 'Model Details', only: [:show, :edit] do
		ul do
			li link_to 'List all items', admin_model_model_items_path(model)
		end
	end

end
