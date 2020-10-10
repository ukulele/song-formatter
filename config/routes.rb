Rails.application.routes.draw do
  devise_for :users
  resources :songs

  authenticated :user do
    root :to => 'songs#index'
  end
  # root :to => "users#index"
  # devise_for :users
  # resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
