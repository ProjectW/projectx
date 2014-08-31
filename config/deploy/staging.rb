role :app, %w{root@104.131.27.192} # need to change to deploy@pinpeg.io

# FIXME this is not precompiling assets or running rake
namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      within '/var/www/pinpeg/current' do
        execute 'kill `cat /home/unicorn/pids/unicorn.pid`; true' # don't care about exit status
        execute :bundle, :exec, 'unicorn_rails -c config/unicorn.rb -D -E production'
      end
    end
  end
  after :publishing, :restart

end
