# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.scss, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( active_admin.css )

Rails.application.config.assets.precompile += %w(*.svg *.eot *.woff *.ttf)

Rails.application.config.assets.precompile << Proc.new {
		|path, fn| fn =~ /vendor\/assets\/bower_components\/mdi\/css/ && !%w(.css .map).include?(File.extname(path)) }
