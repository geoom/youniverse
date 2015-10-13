ActiveAdmin.register Product do

	permit_params :name, :description, :published, :design_image
	actions :all, except: [:destroy]

	index do
		column :name
		column :description
		column :design_image do |product|
			link_to product.design_image.url, target: '_blank' do
				image_tag(product.design_image.url(:thumb))
			end
		end
		column :published
		column :created_at
		actions
	end

	form :html => {:enctype => 'multipart/form-data'} do |f|
		f.inputs 'Details' do
			f.input :name
			f.input :description
			f.input :published
			f.input :design_image, hint: f.product.design_image ? image_tag(f.product.design_image.url, height: '100') : content_tag(:span, "Upload JPG/PNG/GIF image")
		end
		f.actions
	end

	show do |product|
		attributes_table do
			row :name
			row :description
			row :published
			row :design_image do
				image_tag(product.design_image.url(:thumb))
				product.design_image ? image_tag(product.design_image.url, height: '100') : content_tag(:span, "No image yet")
			end
		end
	end

	action_item :view, only: :show do
		link_to 'Add model', new_admin_product_model_path(product)
	end

	sidebar 'Product Details', only: [:show, :edit] do
		ul do
			li link_to 'List all models', admin_product_models_path(product)
		end
	end

end
