Perfdashboard::Engine.routes.draw do

  root 'requests#index'

  resources :requests

end
