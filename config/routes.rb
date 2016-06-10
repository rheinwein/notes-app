Rails.application.routes.draw do
  root to: redirect('/login', status: 302)

  get    'login',     to: 'sessions#new',     as: :login
  delete 'logout',    to: 'sessions#destroy', as: :logout

  resources :sessions, only: [:create, :destroy]
  resources :issues, only: [:index, :create, :show] do
    patch '/complete', to: 'issues#complete', as: :complete

    resources :comments, only: [:create]
  end

  namespace :admin do
    root to: 'dashboard#show', as: :dashboard

    resources :users, except: [:show]
  end

end
