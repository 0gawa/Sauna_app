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
    resources :users, only: [:show, :edit, :update]
    resources :saunas, only: [:show, :index]

    resources :tweets do 
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
