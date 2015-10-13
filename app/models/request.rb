class Request < ActiveRecord::Base

	belongs_to :user
	STATUS_OPTIONS = %w[submitted approved rejected]

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

	validates :name, :presence => true, :uniqueness => true
	validates :about, :presence => true, length: {
			minimum: 10,
			maximum: 500,
			too_short: "must have at least %{count} words",
			too_long: "must have at most %{count} words"
	}

end
