Rails.application.routes.draw do
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#createlocal'
  get 'welcome', to: 'sessions#welcome'
  get 'logout', to: 'sessions#destroy'
  get '/auth/facebook/callback' => 'sessions#create'
  get 'decks/commented', to: 'decks#commented'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
resources :decks do 
  resources :comments 
end 
resources :comments
resources :users do 
  resources :decks  
  resources :comments 
end
resources :archetypes

end
