# use rake routes to see the routing
Projectx::Application.routes.draw do

  get 'home/index'
  get '/about_us' => 'home#about_us'
  get '/privacy' => 'home#privacy'
  get '/contact' => 'home#get_contact'
  post '/contact' => 'home#post_contact'

  namespace :student do

    # angular apps
    get '/dashboard' => 'student_dashboard#show'
    get '/company' => 'company_profile#show'

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

    root to: redirect('/student/dashboard')
  end

  namespace :company do
    get '/dashboard' => 'company_dashboard#show'

    root to: redirect('/company/dashboard')
  end

  root to: 'home#index'
end
