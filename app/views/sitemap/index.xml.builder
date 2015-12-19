xml.instruct!

xml.urlset(xmlns: 'http://www.sitemaps.org/schemas/sitemap/0.9') do
	xml.url do
		xml.loc root_url
		xml.changefreq('hourly')
		xml.priority '1.0'
	end
	@static_pages.each do |page_url|
		xml.url do
			xml.loc page_url
			xml.changefreq('monthly')
		end
	end
	# @products.each do |product|
	# 	xml.url do
	# 		xml.loc product_url(product)
	# 		xml.changefreq('daily')
	# 		xml.priority '0.8'
	# 		xml.lastmod product.updated_at.strftime('%Y-%m-%dT%H:%M:%S.%2N%:z')
	# 	end
	# end
end