# use rake routes to see the routing
Projectx::Application.routes.draw do

  namespace :student do
    match 'dashboard/(:action)', 
      :controller => :student_dashboard, 
      :via => [:get], 
      :defaults => { :action => 'show' }, 
      :as => :dashboard

    match 'company/:id',
      :controller => :company_profile,
      :via => [:get], 
      :defaults => { :action => 'show'}

    devise_for :account, :class_name => 'StudentAccount', :path => 'account', :path_names => {
      :sign_in => 'login', 
      :sign_out => 'logout',
      :sign_up => 'register'
    } 

    # resources :companies
    resources :resumes
    get '/student/reviews/submit' => 'student/reviews#submit' # FIXME change the way this path is required
    resources :reviews
  end

  # namespace :company do
  #   match 'dashboard/(:action)',
  #     :controller => :company_dashboard, 
  #     :via => [:get],
  #     :defaults => { :action => 'show' }

  #   get 'payment/index'
  # end

  get 'home/index'
  get '/about_us' => 'home#about_us'
  
# root to: 'student/reviews#index'
root to: 'home#index'


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
