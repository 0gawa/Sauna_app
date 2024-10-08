Rails.application.routes.draw do 
  # 顧客用
  # URL /users/sign_in ...
  devise_for :users, controllers: {
    registrations: "public/registrations",
    confirmations: "public/confirmations",
    sessions: 'public/sessions',
    passwords: 'public/passwords',
    omniauth_callbacks: 'public/omniauth_callbacks'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :managers, controllers: {
    #registrations: "admin/registrations",
    sessions: 'admin/sessions'
  }
  
  scope module: :public do
    root to: 'homes#top'
    get "homes/privacy_policy"=>"homes#privacy_policy", as: "privacy"
    resources :users, only: [:show, :edit, :update]
    get "/user/unsubscribe" => "users#unsubscribe", as: 'unsubscribe'
    patch "/user/withdraw" => "users#withdrawal", as: 'withdrawal'
    resources :saunas, only: [:show, :index] do
      resources :sauna_comments, only: [:create, :destroy]
      resource :sauna_favorite, only: [:create, :destroy]
      collection do
        post "search"
      end
    end

    # サウナ施設詳細ページにおけるタブ機能のルーティング
    ## サウナ施設ごとのみんなの投稿
    patch "/saunas/:id/tweets" => "saunas#tab_tweets", as: "tab_tweets"

    resources :tweets do 
      resources :tweet_comments, only: [:create, :destroy]
      resource :favorite, only: [:create, :destroy]
    end

    resources :contacts, except: [:update]
    post "/contacts/contact/:id" => "contacts#contact", as: "contact_form"
    post "/contacts/information/:id" => "contacts#information",as: "sauna_info"

  end

  namespace :admin do
    root to: "homes#top"
    resources :tweets, only: [:index, :show, :destroy]
    resources :saunas
  end

  
  get '*not_found' => 'application#routing_error', constraints: lambda { |request| !request.path.include?("active_storage") }
  post '*not_found' => 'application#routing_error', constraints: lambda { |request| !request.path.include?("active_storage") }
end
