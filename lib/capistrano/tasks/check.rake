namespace :check do

  desc "Check that we can access everything"
  task :write_permissions do
	  on roles(:all) do |host|
		  if test("[ -w #{fetch(:deploy_to)} ]")
			  info "#{fetch(:deploy_to)} is writable on #{host}"
		  else
			  error "#{fetch(:deploy_to)} is not writable on #{host}"
		  end
	  end
  end

  desc "checks whether the currently checkout out revision matches the
        remote one we're trying to deploy from"
  task :revision do
	  branch = fetch(:branch)
	  unless `git rev-parse HEAD` == `git rev-parse origin/#{branch}`
		  puts "WARNING: HEAD is not the same as origin/#{branch}"
		  puts "Run `git push` to sync changes or make sure you've"
		  puts "checked out the branch: #{branch} as you can only deploy"
		  puts "if you've got the target branch checked out"
		  exit
	  end
  end

  # desc "Makes sure local git is in sync with remote."
  # task :check_revision do
	#   unless `git rev-parse HEAD` == `git rev-parse origin/master`
	# 	  puts "WARNING: HEAD is not the same as origin/master"
	# 	  puts "Run `git push` to sync changes."
	# 	  exit
	#   end
  # end

end