Rails.application.routes.draw do
  resources :categories do
    resources :subcats do
      resources :products
    end
  end
  resources :subcats
  resources :products
  root to: 'visitors#index'
end
