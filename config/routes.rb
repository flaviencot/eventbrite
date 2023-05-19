Rails.application.routes.draw do
  get 'avatars/create'
  get 'static_pages/secret'
  devise_for :users
  resources :attendance
  resources :event
  resources :user
  root 'event#index'

  resources :users, only: [:show] do
    resources :avatars, only: [:create]
  end

  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'success', to: 'checkout#success', as: 'checkout_success'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
    resources :orders, only: [:new, :create]
  end
end
