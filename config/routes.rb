Rails.application.routes.draw do
  root to: 'pages#home'
  
  # Only use create action
  resources :contacts, only: :create
  
  #Custom URL for contact page.
  #instead of original: '/contacts/new' changing it to: 'contact-us'
  # Then pointing to the contacts controller, new action
  
  # the 'new_contact' comes from routes file.  Do 'rails routes' and see prefix
  get 'contact-us', to: 'contacts#new', as: 'new_contact'
end
