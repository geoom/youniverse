ActiveAdmin.register Product do

	permit_params :name, :description, :design_image

	filter :name

	index do
		column :name
		column :description
		column :design_image do |product|
			link_to product.design_image.url, target: '_blank' do
				image_tag(product.design_image.url(:thumb))
			end
		end
		column :active
		column :created_at
		actions
	end

	form :html => {:enctype => 'multipart/form-data'} do |f|
		f.inputs 'Details' do
			f.input :name
			f.input :description
			f.input :design_image, hint: f.product.design_image ? image_tag(f.product.design_image.url, height: '100') : content_tag(:span, "Upload JPG/PNG/GIF image")
		end
		f.actions
	end

	show do |product|
		attributes_table do
			row :name
			row :description
			row :design_image do
				image_tag(product.design_image.url(:thumb))
				product.design_image ? image_tag(product.design_image.url, height: '100') : content_tag(:span, "No image yet")
			end
		end
	end

end
