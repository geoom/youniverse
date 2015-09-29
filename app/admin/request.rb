ActiveAdmin.register Request do

	permit_params :name, :about, :image

	filter :name

	index do
		column :name
		column :about
		column :image do |request|
			link_to request.image.url, target: '_blank' do
				image_tag(request.image.url(:thumb))
			end
		end
		actions
	end

	form :html => {:enctype => 'multipart/form-data'} do |f|
		f.inputs 'Details' do
			f.input :name
			f.input :about
			f.input :image, hint: f.request.image? ? image_tag(f.request.image.url, height: '100') : content_tag(:span, "Upload JPG/PNG/GIF image")
		end
		f.actions
	end

	show do |request|
		attributes_table do
			row :name
			row :about
			row :image do
				image_tag(request.image.url(:thumb))
				request.image? ? image_tag(request.image.url, height: '100') : content_tag(:span, "No image yet")
			end
		end
	end

end
