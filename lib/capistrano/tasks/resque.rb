namespace :resque do
	desc 'Start resque'
	task :start do
		on roles(:app) do
		run("cd #{current_path} ; echo \"nohup bundle exec rake resque:work QUEUE=* RAILS_ENV=#{rails_env} PIDFILE=tmp/pids/resque_worker_1.pid &\nnohup bundle exec rake resque:work QUEUE=* RAILS_ENV=#{rails_env} PIDFILE=tmp/pids/resque_worker_2.pid &\nsleep 5s\" > startworker.sh ")
		run("cd #{current_path} ; chmod +x startworker.sh")
		run("cd #{current_path} ; ./startworker.sh")
		run("cd #{current_path} ; rm startworker.sh")
		end
	end
end