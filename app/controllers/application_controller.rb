class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  #before_action :authorize

  #Check logged user
  protected

  def authorize
    unless User.find_by(id: session[:user_id])
      redirect_to login_url, notice: "Пожалуйста, пройдите авторизацию!"
    end
  end

end
