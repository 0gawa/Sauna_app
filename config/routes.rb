Rails.application.routes.draw do
  
  # 顧客用
  # URL /users/sign_in ...
  devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }
  
  scope module: :public do
    root to: 'homes#top'
    resources :users
    resources :saunas
  end

  namespace :admin do
    resources :saunas
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  
  get '*not_found' => 'application#routing_error'
  post '*not_found' => 'application#routing_error'
end
