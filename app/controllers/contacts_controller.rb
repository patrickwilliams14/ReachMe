class ContactsController < ApplicationController
  
  # As soon as someone visits contact form page, this 'new' action gets run
  # creates an empty object automatically
  # GET request to /contact-us
  # Show new contact form
  def new
    @contact = Contact.new
  end
  
  # POST request to /contacts
  def create
    @contact = Contact.new(contact_params)
    
    if @contact.save
      # We have to collect the name, email and body from the form fields
      # The Word params related to stuff in form fields/links.
      # Code right below: This is how we grab it..you use params to do this
      # This is how you lift from form fields in controller
      # Go into contact form after saved and grab all these form fields, assign to 
      # variables and use in next line - storing form fields via parameters into variables
      name = params[:contact][:name]
      email = params[:contact][:email]
      body = params[:contact][:comments]
      # Plug variables into ContactMailer email method and send email
      ContactMailer.contact_email(name, email, body).deliver
      # Store success message in flash hash
      # Redirect to new action
      flash[:success] = "Message Sent!"
      redirect_to new_contact_path
    else
      # If Contact object doesn't save,
      # Store errors in flash hash, and redirect to new path/action
      flash[:danger] = @contact.errors.full_messages.join(", ")
      redirect_to new_contact_path
    end
  end
  
  private
  # To collect data from form, we need to use
  # Strong parameters and whitelist the form fields - started in rails 4 - security feature
    def contact_params
      params.require(:contact).permit(:name, :email, :comments)
    end
end