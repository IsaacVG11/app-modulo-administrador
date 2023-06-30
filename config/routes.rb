Rails.application.routes.draw do
  #Ruta para el devise
  devise_for :user_logins, path_names: { sign_in: 'login' , sign_out: 'logout', password: 'secret', confirmation: 'verification', unblock: 'unblock', registration: 'register' , sign_up: 'sign_up' }

  #Rutas para los controladores que van a mostrarse en la pagina
  resources :orderviews
  resources :dishviews
  resources :clientviews

  #Rutas que son para el api
  scope module: :api do
    resources :users do
      post 'buscar_por_email_user', action: :buscar_por_email_user, on: :collection
    end
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
