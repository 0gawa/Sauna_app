Rails.application.routes.draw do
  
  # 顧客用
  # URL /users/sign_in ...
  devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :managers, controllers: {
    registrations: "admin/registrations",
    sessions: 'admin/sessions'
  }
  
  scope module: :public do
    root to: 'homes#top'
    get "homes/privacy_policy"=>"homes#privacy_policy", as: "privacy"
    resources :users, only: [:show, :edit, :update]
    get "/user/unsubscribe" => "users#unsubscribe", as: 'unsubscribe'
    patch "/user/withdraw" => "users#withdrawal", as: 'withdrawal'
    resources :saunas, only: [:show, :index, :create, :update] do
      resources :sauna_comments, only: [:create, :destroy]
      resource :sauna_favorite, only: [:create, :destroy]
      collection do
        post "search"
      end
    end

    resources :tweets do 
      resources :tweet_comments, only: [:create, :destroy]
      resource :favorite, only: [:create, :destroy]
    end

  end

  namespace :admin do
    root to: "homes#top"
    resources :tweet, only: [:index, :show]
    resources :saunas, except: [:update, :create]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  
  get '*not_found' => 'application#routing_error', constraints: lambda { |request| !request.path.include?("active_storage") }
  post '*not_found' => 'application#routing_error', constraints: lambda { |request| !request.path.include?("active_storage") }
end
