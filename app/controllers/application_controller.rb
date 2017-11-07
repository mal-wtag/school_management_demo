class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  protected
  def authenticate_user!
    if !logged_in?
      flash[:danger]="you have to log in first"
      redirect_to login_path
    end
  end
end
