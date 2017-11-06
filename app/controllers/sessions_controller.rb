class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:success] = "Welcome to the app"
      redirect_to user
    else
      flash.now[:danger] = "Invalid Email / password combination"
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    @current_user=nil
    redirect_to root_url
  end
end
