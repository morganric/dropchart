Rails.application.routes.draw do

  get '/tagged/:tag', to: 'drops#tag', as: :tag

  resources :drops
  mount Upmin::Engine => '/admin'


  root to: 'drops#index'
  devise_for :users
  resources :users
end
