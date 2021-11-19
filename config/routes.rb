Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "dashboard#index"
  get "/dashboard", to: "dashboard#index"

  resources :categories do
    resources :sub_categories
  end

  resources :articles

  namespace :admin do
    resources :categories do
      resources :sub_categories
    end
    resources :authors
    resources :topics
    resources :articles do
      member do
        patch :publish
        patch :unpublish
      end
    end

    get "/sub_categories", to: "sub_categories#sub_categories"
  end

  namespace :api, format: :json do
    resources :categories, only: [:index]
    resources :sub_categories, only: [:index]
    resources :authors, only: [:index]
    resources :articles do
      resources :thumbnails, only: [:destroy]
    end
  end
end
