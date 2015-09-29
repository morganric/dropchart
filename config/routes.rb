Rails.application.routes.draw do

  get '/artist/:artist' => 'drops#artist', as: :artist

  resources :profiles
  get '/tagged/:tag', to: 'drops#tag', as: :tag

  resources :drops
  mount Upmin::Engine => '/admin'

  scope ":id" do
    
    get '/', to: 'profiles#show', as: :vanity_profile
   
  end

  get '/:user_id/:id' => 'drops#show', as: :user_drop




  root to: 'drops#index'
  devise_for :users
  resources :users
end
