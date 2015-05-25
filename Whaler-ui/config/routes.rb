Rails.application.routes.draw do
  root 'home#index'
  get '/home' => 'home#home'
  get '/images' => 'image#list'
  get '/container' => 'container#list', as: :container
end