Projectx::Application.routes.draw do
  # use rake routes to see the routing

  namespace :student do
    get "student_dashboard/index"

    # note devise helpers will now be called as the following line
    # :authenticate_student_student_account rather than :authenticate_student_account
    devise_for :student_account, :path => 'account', :path_names => {
      :sign_in => 'login', :sign_out => 'logout'
    } 

    # resources :student_account
  end

  # get "student_dashboard/index"
  get "home/index"

root to: 'home#index'
  get "/about_us" => 'home#about_us'

root to: 'home#index'
  get "/for_companies" => 'home#for_companies'
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
