# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def contact_form
  	UserMailer.contact_form("john@example.com", "John", "Hello World!")
  end

  def signup_form
  	UserMailer.signup_form("john@example.com")
  end
end