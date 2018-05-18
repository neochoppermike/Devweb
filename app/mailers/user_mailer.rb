class UserMailer < ApplicationMailer
  default from: "from@example.com"

  def contact_form(email, name, message)
    @message = message
    mail(from: email,
         to: 'zuzuspetals@hotmail.co.uk',
         subject: "A new contact form message from #{name}")
  end

  def welcome(user)
    mail(from: 'zuzuspetals@hotmail.co.uk',
         to: user.email,
         subject: "Hi there!",
         cc: 'zuzuspetals@hotmail.co.uk')
  end
    
  def order_placed(user, order)
    @user = user
    @order = order
    @product = order.product

    mail(from: 'zuzuspetals@hotmail.co.uk',
         to: user.email,
         subject: "Payment received",
         cc: 'zuzuspetals@hotmail.co.uk')
  end

end
