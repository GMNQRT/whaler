Rails.application.routes.draw do

  root 'home#index'

  scope :partials do
    get '/home' => 'home#home'
    resources :images
    resources :containers do
      member do
        get 'start'
      end
      member do
        get 'stop'
      end
      member do
        get 'restart'
      end
      member do
        get 'delete'
      end
    end
    get '/users/sign_in' => 'sessions#new'
    get '/users/sign_out' => 'registrations#new'
    get '/users/sign_up' => 'registrations#new'
  end

  get '*path' => 'home#index'
end