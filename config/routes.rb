Rails.application.routes.draw do

root 'welcome#index'
get 'sign_out' => 'sessions#destroy', as: 'signout'
resources :users
resources :statuses
resources :sessions
resources :likes


end
