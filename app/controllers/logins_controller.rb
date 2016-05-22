class LoginsController < ApplicationController
  # This is the action triggered by login form
  #   if we don't find user by given email we create new one
  def create
    user = User.find_or_create_by!(email: params[:email]) do |user|
      user.name = 'Edit me!'
    end
    # Here we set unique login token which is valid only for next 15 minutes
    user.update!(login_token: SecureRandom.urlsafe_base64,
                 login_token_valid_until: Time.now + 15.minutes)

    LoginMailer.login_link(user).deliver

    redirect_to root_path, notice: 'Login link sended to your email'
  end
end
