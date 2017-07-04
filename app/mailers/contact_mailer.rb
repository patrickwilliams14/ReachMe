class ContactMailer < ActionMailer::Base
  default to: 'patrickwilliams1414@gmail.com'
  
  def contact_email(name, email, body)
    @name = name
    @email = email
    @body = body
    mail(from: email, subject: 'Contact Form Message')
  end
end

# Since we're dealing with the contact form, we called this file ContactMailer