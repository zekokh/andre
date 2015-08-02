class ApplicationController < ActionController::Base
  helper_method :current_user
  protect_from_forgery with: :exception

  before_action :authorize


  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  #Check logged user
  protected

  def authorize #todo change to predicate #user_signed_in?
    return if current_user
    redirect_to new_session_path, notice: "Пожалуйста, пройдите авторизацию!"
  end
end
