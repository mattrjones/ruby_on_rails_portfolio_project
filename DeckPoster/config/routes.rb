Rails.application.routes.draw do
  get 'comments/index'
  get 'comments/new'
  get 'comments/show'
  get 'users/index'
  get 'users/new'
  get 'users/show'
  get 'users/create'
  get 'archetypes/index'
  get 'archetypes/show'
  get 'archetypes/new'
  get 'archetypes/create'
  get 'decks/index'
  get 'decks/show'
  get 'decks/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
