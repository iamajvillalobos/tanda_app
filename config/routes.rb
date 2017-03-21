Rails.application.routes.draw do
  resources :datastreams, only: [:index]
end
