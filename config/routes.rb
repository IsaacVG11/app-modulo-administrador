Rails.application.routes.draw do


  mount ActionCable.server => "/cable"


  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    registrations: 'admins/registrations'
  }


  resources :orderviews
  resources :dishviews
  resources :clientviews
  resources :stateviews
  resources :chefviews
  resources :adminviews, only: [:index, :show, :new, :create, :edit, :update, :destroy]


  scope module: :api do
    resources :chefs do
      post 'buscar_por_email', action: :buscar_por_email, on: :collection
    end
    resources :states
    resources :dishes
    resources :orders
    resources :clients do
      post 'buscar_por_email', action: :buscar_por_email, on: :collection
    end
     resources :dishxorders
  end


  root "home#index"

end
