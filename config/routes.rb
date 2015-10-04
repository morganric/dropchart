Rails.application.routes.draw do

  devise_for :users
  resources :users

  get '/artist/:artist' => 'drops#artist', as: :artist
  get '/label/:label' => 'drops#label', as: :label
    get '/featured' => 'drops#featured', as: :featured
  get ':user_id/:id/embed' => 'drops#embed', as: :embed

  resources :profiles
  get '/tagged/:tag', to: 'drops#tag', as: :tag
  get '/drops/:id/play' => 'drops#plays', as: :post_play

  resources :drops
  mount Upmin::Engine => '/admin'


  get '/:user_id/:id' => 'drops#show', as: :user_drop


    scope ":id" do
    
    get '/', to: 'profiles#show', as: :vanity_profile
   
  end


  root to: 'drops#index'


  
end
