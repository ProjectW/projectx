# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'pinpeg'

set :repo_url, 'git@github.com:ProjectW/projectx.git'
set :branch, 'beta'

set :stage, :production

set :linked_files, %w{config/database.yml config/initializers/secret_token.rb}

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute 'service unicorn restart'
    end
  end

  after :publishing, :restart

end
