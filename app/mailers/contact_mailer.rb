class ContactMailer < ApplicationMailer::Based
  default to: 'patrickwilliams1414@gmail.com'
  def contact_email(name, email, body)
    @name = name
    @email = email
    @body = body
    mail(from: email, subject: 'Contact Form Message')
  end

end