namespace :setup do

	desc 'Upload yml files'
	task :upload_yml do
		on roles(:app) do
			execute "mkdir -p #{shared_path}/config"
			upload! StringIO.new(File.read('config/database.yml')), "#{shared_path}/config/database.yml"
			upload! StringIO.new(File.read('config/secrets.yml')), "#{shared_path}/config/secrets.yml"
		end
	end

	desc 'Seed the database'
	task :seed_db do
		on roles(:app) do
			within "#{release_path}" do
				with rails_env: :production do
					execute :rake, 'db:seed'
				end
			end
		end
	end

	desc 'Symlinks config files for nginx and unicorn.'
	task :symlink_config do
		on roles(:app) do
			sudo 'rm -f /etc/nginx/sites-enabled/default'

			sudo "ln -nfs #{release_path}/config/nginx.conf /etc/nginx/sites-enabled/#{fetch(:application)}"
			sudo "ln -nfs #{release_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{fetch(:application)}"

			# which of the above files should be marked as executable
			executable_files = fetch(:executable_config_files)
			executable_files.each do |file|
				execute :chmod, "+x #{release_path}/config/#{file}"
			end
		end
	end
end