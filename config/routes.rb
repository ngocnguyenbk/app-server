Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "dashboard#index"
  get "/dashboard", to: "dashboard#index"

  resources :categories

  namespace :admin do
    resources :categories do
      resources :sub_categories
    end

    get "/sub_categories", to: "sub_categories#sub_categories"
  end
end
