Rails.application.routes.draw do
  devise_for :users
  root to: 'contents#index'
  resources :contents, only:[:index, :new, :create, :edit, :update, :destroy] do
    collection do
      get 'search'
    end
  end
  resources :choices do
    resources :votes, only: [:create, :destroy]
  end
end
