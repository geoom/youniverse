ActiveAdmin.register ModelItem do


	permit_params :sex, :price, :published, :image
	actions :all, except: [:destroy]
	belongs_to :model
	navigation_menu :model

	form :html => {:enctype => 'multipart/form-data'} do |f|
		f.semantic_errors *f.object.errors.keys
		f.inputs 'Details' do
			f.input :model, :as => :select, :collection => Model.all
			f.input :sex, :as => :radio, :collection => {'Male' => 'm', 'Female' => 'f', 'Unisex' => 'u'}
			f.input :price, :hint => '4 integers at most and 2 decimals at most, example: 3452.54, price in dollars'
			f.input :published
			f.input :image, hint: f.model_item.image? ? image_tag(f.model_item.image.url, height: '100') : content_tag(:span, "Upload JPG/PNG/GIF image")
		end
		f.actions
	end

	index :as => :grid do |model_item|
		div do
			a :href => admin_model_model_item_path(model_item.model, model_item) do
				image_tag(model_item.image.url(:thumb))
			end
		end
	end

	show do |model_item|
		attributes_table do
			row :sex do
				if model_item.sex == 'm'
					content_tag(:span, 'male')
				elsif model_item.sex == 'f'
					content_tag(:span, 'female')
				elsif model_item.sex == 'u'
					content_tag(:span, 'unisex')
				else
					content_tag(:span, 'unknown')
				end
			end
			row :price
			row :image do
				image_tag(model_item.image.url(:thumb))
				model_item.image ? image_tag(model_item.image.url, height: '100') : content_tag(:span, "No image yet")
			end
		end
	end


end
