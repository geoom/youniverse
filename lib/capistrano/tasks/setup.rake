namespace :setup do

	desc 'Upload database.yml file'
	task :upload_db do
		on roles(:app) do
			execute "mkdir -p #{shared_path}/config"
			upload! StringIO.new(File.read('config/database.yml')), "#{shared_path}/config/database.yml"
		end
	end

	desc 'Seed the database'
	task :seed_db do
		on roles(:app) do
			within "#{current_path}" do
				with rails_env: :production do
					execute :rake, 'db:seed'
				end
			end
		end
	end

	desc 'Symlinks config files for Nginx and Unicorn.'
	task :symlink_config do
		on roles(:app) do
			sudo 'rm -f /etc/nginx/sites-enabled/default'

			sudo "ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-enabled/#{fetch(:application)}"
			sudo "ln -nfs #{current_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{fetch(:application)}"

			# sudo "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
		end
	end
end