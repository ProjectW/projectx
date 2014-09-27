# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'pinpeg'

set :repo_url, 'git@github.com:ProjectW/projectx.git'
set :branch, ENV['branch'] || 'master'

set :stage, :production

set :conditionally_migrate, true
set :assets_roles, [:app]

set :linked_files, %w{config/database.yml config/initializers/secret_token.rb}
set :normalize_asset_timestamps, %{ public/images }

set :rvm_type, :system
set :rvm_ruby_version, '2.1.2'

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute 'service unicorn restart'
    end
  end

  after :publishing, :restart

end
