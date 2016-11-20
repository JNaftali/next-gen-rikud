Rails.application.routes.draw do
  get 'categories/show'

  get '/', to: 'home#index'
  resources :categories, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
