Rails.application.routes.draw do
  devise_for :users
  
  resources :users
  root to: 'pages#home'
  
  # Only use create action
  resources :contacts, only: :create
  
  #Custom URL for contact page.
  #instead of original: '/contacts/new' changing it to: 'contact-us'
  # Then pointing to the contacts controller, new action
  
  # the 'new_contact' comes from routes file.  Do 'rails routes' and see prefix
  # The 'as: new_contact' is a path name to use in view file
  get 'contact-us', to: 'contacts#new', as: 'new_contact'
  
  get 'register-school', to: 'registrations#new', as: 'new_registration'
end
