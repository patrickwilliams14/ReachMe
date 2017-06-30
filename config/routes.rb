Rails.application.routes.draw do
  root to: 'pages#home'
  resources :contacts, only: :create
  
  #Custom URL for contact page.
  #instead of original: '/contacts/new' changing it to: 'contact-us'
  # Then pointing to the contacts controller, new action
  
  get 'contact-us', to: 'contacts#new', as: 'new_contact'
end
