class LoginMailer < ApplicationMailer
  def login_link(user)
    @user = user

    mail to: @user.email, subject: 'Sign-in into someapp.com'
  end
end
