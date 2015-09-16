# config valid only for current version of Capistrano
lock '3.1.0'

set :application, 'youniverse'

# setup repo details
set :scm, :git
set :repo_url, 'git@bitbucket.org:geoom/youniverse.git'
set :branch, 'master'

set :deploy_user, 'deployer'
set :deploy_via, :remote_cache
set :deploy_to, "/home/deployer/apps/#{fetch(:application)}"

set :pty, true
set :format, :pretty
set :log_level, :debug

set :linked_files, %w{config/database.yml config/secrets.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

set(:executable_config_files, %w(unicorn_init.sh))

set :keep_releases, 5

# set :rvm_ruby_version, '1.26.11'
set :default_env, {rvm_bin_path: '~/.rvm/bin'}
# SSHKit.config.command_map[:rake] = "#{fetch(:default_env)[:rvm_bin_path]}/rvm ruby-#{fetch(:rvm_ruby_version)} do bundle exec rake"

# what specs should be run before deployment is allowed to
# continue, see lib/capistrano/tasks/run_tests.cap
set :tests, []

# Default value for :log_level is :debug
set :log_level, :debug

# which config files should be copied by deploy:setup_config
# see documentation in lib/capistrano/tasks/setup.rake
# for details of operations
set(:config_files, %w(nginx.conf database.yml unicorn.rb unicorn_init.sh))

# which config files should be made executable after copying
# by deploy:setup_config
set(:executable_config_files, %w(unicorn_init.sh))

namespace :deploy do

	before :deploy, 'check:write_permissions'
	after 'check:write_permissions', 'check:revision'
	before :starting, 'setup:upload_yml'
	before 'unicorn:restart', 'setup:symlink_config'
	after :deploy, 'unicorn:restart'
	after 'unicorn:restart', 'nginx:restart'

	after :rollback, 'deploy:restart'
	after :finishing, 'deploy:cleanup'
end
