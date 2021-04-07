Rails.application.routes.draw do
  devise_for :admin_users
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  scope module: 'admin_users' do
    resources :articles do
    resources :elements
  end
end
  end
