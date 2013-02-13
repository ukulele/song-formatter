SongsheetMaker::Application.routes.draw do
  resources :songs

  authenticated :user do
    root :to => 'songs#index'
  end
  root :to => "users#index"
  devise_for :users
  resources :users
end