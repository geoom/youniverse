namespace :unicorn do
  desc 'Commands for unicorn application'
  %w(start stop force-stop restart upgrade reopen-logs).each do |command|
    task command.to_sym do
      on roles(:app), in: :sequence, wait: 5 do
        sudo "/etc/init.d/unicorn_#{fetch(:application)} #{command}"
      end
    end
  end
end