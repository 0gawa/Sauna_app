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
    resources :users

    resources :saunas, only: [:show, :index] do
      resource :sauna_favorite, only: [:create, :destroy]
    end

    resources :tweets do 
      resources :tweet_comments, only: [:create, :destroy]
      resource :favorite, only: [:create, :destroy]
    end
  end

  namespace :admin do
    root to: "homes#top"
    resources :saunas
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  
  get '*not_found' => 'application#routing_error', constraints: lambda { |request| !request.path.include?("active_storage") }
  post '*not_found' => 'application#routing_error', constraints: lambda { |request| !request.path.include?("active_storage") }
end
