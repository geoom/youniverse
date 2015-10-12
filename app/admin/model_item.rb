ActiveAdmin.register ModelItem do


	permit_params :sex, :price, :image
	belongs_to :model

	form :html => {:enctype => 'multipart/form-data'} do |f|
		f.inputs 'Details' do
			f.input :sex
			f.input :price
			f.input :image, hint: f.model_item.image ? image_tag(f.model_item.image.url, height: '100') : content_tag(:span, "Upload JPG/PNG/GIF image")
		end
		f.actions
	end

	index do
		column :sex
		column :price
		column :image do |model_item|
			link_to model_item.image.url, target: '_blank' do
				image_tag(model_item.image.url(:thumb))
			end
		end
		column :active
		column :created_at
		actions
	end

	show do |model_item|
		attributes_table do
			row :sex
			row :price
			row :image do
				image_tag(model_item.image.url(:thumb))
				model_item.image ? image_tag(model_item.image.url, height: '100') : content_tag(:span, "No image yet")
			end
		end
	end


end
