class SessionsController < ApplicationController
  # This is the action triggered by login link
  def create
    # We don't sign in user with token which expired
    user = User.where(login_token: params[:token]).where('login_token_valid_until > ?', Time.now).first

    if user
      # Here we nullify login token so it can't be reused
      user.update!(login_token: nil, login_token_valid_until: 1.year.ago)

      self.current_user = user
      redirect_to root_path, notice: 'Signed-in sucesfully'
    else
      redirect_to root_path, alert: 'Invalid or expired login link'
    end
  end

  # Simple sign-out. Just set current user to NullUser
  def destroy
    self.current_user = NullUser.new
    redirect_to root_path, notice: 'Sucesfully signed-out'
  end
end
