Rails.application.routes.draw do
  #Ruta para el devise
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    registrations: 'admins/registrations'
  }

  #Rutas para los controladores que van a mostrarse en la pagina
  resources :orderviews
  resources :dishviews
  resources :clientviews
  resources :stateviews
  resources :chefviews
  resources :adminviews, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  #Rutas para los controladores que son para el api
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

  #Ruta a la pagina principal
  root "home#index"

end
