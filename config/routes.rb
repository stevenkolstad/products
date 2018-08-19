Rails.application.routes.draw do
  resources :categories do
    resources :subcats do
      resources :products
    end
  end

  root to: 'visitors#index'
end
