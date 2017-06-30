class ContactsController < ApplicationController
  
  # As soon as someone visits contact form page, this 'new' action gets run
  # creates an empty object automatically
  def new
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(contact_params)
    
    if @contact.save
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