Perfdashboard::Engine.routes.draw do

  root 'requests#index'

  resources :requests, only: [:create]

  resources :servers do
    resources :requests, only: [:index, :show]
    resources :actions
    resources :contexts
  end

  resources :contexts

end
