Rails.application.routes.draw do
  get 'categories/index'
  get 'categories/show'
  resources :pages, except: [:show]
  get "pages/:permalink" => "pages#permalink", as: "permalink" # this is equivalent to permalink_path
  # get 'products/index'
  # get 'products/show'
  # get 'manufacturers/index'
  # get 'manufacturers/show'
  resources :products, only: %i[index show] do
    collection do
      get "search"
    end
  end
  resources :manufacturers, only: %i[index show]
  root to: "products#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
