class ModelItem < ActiveRecord::Base
	belongs_to :model

	has_attached_file :image,
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

	validates_attachment :image,
	                     :presence => true,
	                     :size => { :in => 0..10.megabytes },
	                     :content_type => { :content_type => /^image\/(jpeg|png|gif)$/ }

end
