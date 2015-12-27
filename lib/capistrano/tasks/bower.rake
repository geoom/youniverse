namespace :bower do
	desc 'Install bower packages'
	task :install do
		on roles(:app) do
			within "#{release_path}" do
				execute :rake, 'bower:install'
			end
		end
	end
end