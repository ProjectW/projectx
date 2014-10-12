# use rake routes to see the routing
Projectx::Application.routes.draw do

  get 'home/index'
  get '/about' => 'home#about'
  get '/privacy' => 'home#privacy'
  get '/contact' => 'home#get_contact'
  post '/contact' => 'home#post_contact'

  get '/partners' => 'home#partners'

  namespace :admin do
    get '/app' => 'admin_app#index'

    get '/all_resumes' => 'admin_app#all_resumes'
    get '/current_resumes' => 'admin_app#current_resumes'

    resources :stats, :only => [:index]

    # angular app
    root to: redirect('/admin/app')
  end

  namespace :student do

    # angular app
    get '/app' => 'student_app#index'

    # devise
    devise_for :account, :class_name => 'StudentAccount', :path => 'account', :path_names => {
      :sign_in => 'login',
      :sign_out => 'logout',
      :sign_up => 'register'
    }

    # api
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

    resources :reviews, :except => [:new] do
      collection do
        get :recent
      end
    end

    resources :companies, :only => [:show] do
      collection do
        get :search
        get :most_reviewed
        get :most_viewed
      end

      member do
        get :reviews
        post :view
        post :watch
      end
    end

    root to: redirect('/student/app')
  end

  namespace :company do
    get '/dashboard' => 'company_dashboard#show'
    post '/dashboard' => 'company_dashboard#post'

    root to: redirect('/company/dashboard')
  end

  root to: 'home#index'
end
