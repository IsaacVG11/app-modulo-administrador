Rails.application.routes.draw do
  devise_for :user_logins, path_names: { sign_in: 'login' , sign_out: 'logout', password: 'secret', confirmation: 'verification', unblock: 'unblock', registration: 'register' , sign_up: 'sign_up' }

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

  root "home#index"

end
