class RegistrationsController < Devise::RegistrationsController
  
  def new
  	super
  end	 

  def create
    super
    if @user.persisted?
      UserMailer.welcome(@user).deliver
    end  
  end

  def update
  	super
  end	

end