ActiveAdmin.register Request do

	actions :all, except: [:edit, :update, :destroy, :new, :create]
	filter :name

	index do
		column :name
		column :about
		column :user
		column :image do |request|
			link_to request.image.url, target: '_blank' do
				image_tag(request.image.url(:thumb))
			end
		end
		column :status
		actions
	end

	show do |request|
		attributes_table do
			row :name
			row :about
			row :user
			row :image do
				link_to request.image.url, target: '_blank' do
					image_tag(request.image.url(:thumb))
					request.image? ? image_tag(request.image.url, height: '100') : content_tag(:span, "No image yet")
				end
			end
			row :status
		end
	end

end