role :app, %w{root@pinpeg.io} # need to change to deploy@pinpeg.io

# FIXME capistrano/rvm fails for production
namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute 'service unicorn restart'
    end
  end
  after :publishing, :restart

end
