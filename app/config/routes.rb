Rails.application.routes.draw do
  root to: "comics#index"

  get 'comics/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
