Rails.application.routes.draw do
  
  root 'landing#index'
  
get ':user_name', to: 'profiles#show', as: :profile

  devise_for :users, :controllers => { registrations: 'registrations' }
  
  resources :posts do
    resources :comments
  end
end
