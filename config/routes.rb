Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  
  # , :controllers => { registrations: 'registrations' }

  get    '/groups' => 'groups#index'
  
  get    '/hires'          => 'hires#index'
  get    '/hires/new'      => 'hires#new'
  get    '/hires/:id'      => 'hires#show'
  post   '/hires'          => 'hires#create'
  get    '/hires/:id/edit' => 'hires#edit'
  patch  '/hires/:id'      => 'hires#update'
  put    '/hires/:id'      => 'hires#update'
  delete '/hires/:id'      => 'hires#destroy'
  
  resources :items
  resources :sizes
  resources :orders

  resources :hires
  root to: 'hires#index'

# devise_for :users

end
