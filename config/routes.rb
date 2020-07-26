Rails.application.routes.draw do
  devise_for :users
  root to: 'contents#index'
  resources :contents, only:[:index, :new]
end
