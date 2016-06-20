Rails.application.routes.draw do
  root to: redirect('/login', status: 302)

  get 'login',     to: 'users#new',        as: :login
  get 'logout',    to: 'sessions#destroy', as: :logout

  resources :users, only: [:new, :create, :destroy]
  resources :sessions, only: [:destroy]
  resources :issues, only: [:index, :create, :show] do
    patch '/complete', to: 'issues#complete', as: :complete

    resources :comments, only: [:create]
  end

  namespace :admin do
    root to: 'dashboard#show', as: :dashboard

    resources :users, except: [:show]
  end
end
