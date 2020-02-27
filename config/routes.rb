Rails.application.routes.draw do
  devise_for :users

  root to: 'lockers#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :lockers do
    resources :bookings
  end

  get '/my_lockers', to: 'pages#my_lockers'
  get '/my_bookings', to: 'pages#my_bookings'
end
