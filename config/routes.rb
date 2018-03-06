Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  
  # , :controllers => { registrations: 'registrations' }


  get '/groups' => 'groups#index'
  resources :hires
  root to: 'hires#index'

# devise_for :users

end
