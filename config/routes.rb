Rails.application.routes.draw do
  # get 'products/index'
  # get 'products/show'
  # get 'manufacturers/index'
  # get 'manufacturers/show'
  resources :products, only: %i[index show]
  resources :manufacturers, only: %i[index show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
