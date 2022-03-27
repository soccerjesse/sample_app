class SessionsController < ApplicationController
  def new
  end

  #post /login
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      # faile
      flash.now[:danger] = 'Invalid email/passward combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
