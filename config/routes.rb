Rails.application.routes.draw do
  devise_for :users
  root to: 'stack#index'

  get ':page' => 'stack#show', as: 'stack'
  # resources :stack, only: :show
  resources :customers, :stack
end
