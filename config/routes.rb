Rails.application.routes.draw do
  


  root 'landing#index'
  
  devise_for :users, :controllers => { registrations: 'registrations' }
  
  resources :posts do
    resources :comments
  end
  
  get 'profiles/show'
  
  get ':user_name', to: 'profiles#show', as: :profile

  get ':user_name/edit', to: 'profiles#edit', as: :edit_profile
  
  patch ':user_name/edit', to: 'profiles#update', as: :update_profile
  
end
