Rails.application.routes.draw do
  resources :charts, only: %i[index create]
  root 'charts#index'
end
