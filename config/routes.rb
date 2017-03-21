Rails.application.routes.draw do
  root to: "datastreams#index"
  resources :datastreams
end
