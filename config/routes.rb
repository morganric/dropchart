Rails.application.routes.draw do
  resources :drops
  mount Upmin::Engine => '/admin'
  root to: 'drops#index'
  devise_for :users
  resources :users
end
