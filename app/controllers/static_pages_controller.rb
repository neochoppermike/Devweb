class StaticPagesController < ApplicationController
  
  def index
  	@products = Product.all
  end

  
  def landing_page
    @products = Product.limit(3)
  end


  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    ActionMailer::Base.mail(from: @email,
      to: 'zuzuspetals@hotmail.co.uk',
      subject: "A new contact form message from #{@name}",
      body: @message).deliver_now

    UserMailer.contact_form(@email, @name, @message).deliver_now
  end
  


end





