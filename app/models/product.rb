class Product < ActiveRecord::Base

	has_many :models

	has_attached_file :design_image,
	                  :path => ':rails_root/public/system/:class/:attachment/:id/:basename_:style.:extension',
	                  :url => '/system/:class/:attachment/:id/:basename_:style.:extension',
	                  :default_url => 'default/design/:style/missing.png',
	                  :styles => {
			                  :thumb    => ['100x100#',  :jpg, :quality => 70],
			                  :preview  => ['480x480#',  :jpg, :quality => 70],
			                  :large    => ['600>',      :jpg, :quality => 70],
			                  :retina   => ['1200>',     :jpg, :quality => 30]
	                  },
	                  :convert_options => {
			                  :thumb    => '-set colorspace sRGB -strip',
			                  :preview  => '-set colorspace sRGB -strip',
			                  :large    => '-set colorspace sRGB -strip',
			                  :retina   => '-set colorspace sRGB -strip -sharpen 0x0.5'
	                  }

	validates_attachment :design_image,
	                     :presence => true,
	                     :size => { :in => 0..10.megabytes },
	                     :content_type => { :content_type => /^image\/(jpeg|png|gif)$/ }

	validates :name,
	          :presence => true,
	          :uniqueness => true


	def cart_action(current_user_id)
		if $redis.sismember "cart#{current_user_id}", id
			"Remove from"
		else
			"Add to"
		end
	end

end
