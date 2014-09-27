# use rake routes to see the routing
Projectx::Application.routes.draw do

  get 'home/index'
  get '/about_us' => 'home#about_us'
  get '/privacy' => 'home#privacy'

  namespace :student do
    get '/dashboard' => 'student_dashboard#show'
    get '/company' => 'company_profile#show'

    # match 'dashboard/(:action)', 
    #   :controller => :student_dashboard, 
    #   :via => [:get], 
    #   :defaults => { :action => 'show' }, 
    #   :as => :dashboard

    # match 'company/(:action/(:id))',
    #   :controller => :company_profile,
    #   :via => [:get], 
    #   :defaults => { :action => 'show'}

    devise_for :account, :class_name => 'StudentAccount', :path => 'account', :path_names => {
      :sign_in => 'login',
      :sign_out => 'logout',
      :sign_up => 'register'
    }
    resource :account, :only => [:show,] do
      member do
        get :company_views
        put :info
      end
    end

    resources :resumes do
      collection do
        get :current
      end
    end

    resources :reviews, :except => [:new, :show]
    resources :companies, :only => [:show] do
      collection do
        get :search
      end

      member do
        get :reviews
        post :view
      end
    end
  end

  # namespace :company do
  #   match 'dashboard/(:action)',
  #     :controller => :company_dashboard, 
  #     :via => [:get],
  #     :defaults => { :action => 'show' }

  #   get 'payment/index'
  # end

  # root to: 'student/reviews#index'
  root to: 'home#index'
end
