Rails.application.routes.draw do

  root to: 'application#index'
  get 'comics/index'
  get 'comics/search'
  post 'favorites/toggle'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
