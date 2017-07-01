class ContactsController < ApplicationController
  
  # As soon as someone visits contact form page, this 'new' action gets run
  # creates an empty object automatically
  def new
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(contact_params)
    
    if @contact.save
      # We have to collect the name, email and body from the form fields
      # The Word params related to stuff in form fields/links.
      # Code right below: This is how we grab it..you use params to do this
      # This is how you lift from form fields in controller
      # Go into contact form after saved and grab all these form fields, assign to 
      # variables and use in next line
      name = params[:contact][:name]
      email = params[:contact][:email]
      body = params[:contact][:comments]
      ContactMailer.contact_email(name, email, body).deliver
      flash[:success] = "Message Sent!"
      redirect_to new_contact_path
    else
      flash[:danger] = @contact.errors.full_messages.join(", ")
      redirect_to new_contact_path
    end
  end
  
  private
    def contact_params
      params.require(:contact).permit(:name, :email, :comments)
    end
end