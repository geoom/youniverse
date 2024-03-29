namespace :deploy do

	# desc "compiles assets locally then rsyncs"
	# task :compile_assets_locally do
	# 	run_locally do
	# 		execute "RAILS_ENV=#{fetch(:rails_env)} bundle exec rake assets:precompile"
	# 	end
	# 	on roles(:app) do |role|
	# 		run_locally do
	# 			execute "rsync -av ./public/assets/ #{role.user}@#{role.hostname}:#{release_path}/public/assets/;"
	# 		end
	# 		sudo "chmod -R 755 #{release_path}/public/assets/"
	# 	end
	# 	run_locally do
	# 		execute "rm -rf ./public/assets"
	# 	end
	# end

	desc 'Synchronize assets files with S3 bucket'
	task :sync_assets do
		on roles(:app) do
			within "#{release_path}" do
				with rails_env: :production do
					execute :rake, 'assets:precompile'
				end
			end
		end
	end


end