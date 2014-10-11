namespace :deploy do
  desc "Seeding Database"
  task :seed do
    on roles(:all) do |host|
      within "#{current_path}" do
        with rails_env: :production do
          execute :rake, "db:seed"
        end
      end
    end
  end
end
