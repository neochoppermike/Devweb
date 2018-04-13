class UserMailer < ApplicationMailer
  default from: "from@example.com"

  def contact_form(email, name, message)
    @message = message
    mail(from: email,
         to: 'zuzuspetals@hotmail.co.uk',
         subject: "A new contact form message from #{name}")
  end

  def signup_form(email)
    mail(from: email,
         to: 'zuzuspetals@hotmail.co.uk',
         subject: "A new signup from #{email}")
  end
    
end
