class LoginController < ApplicationController
  layout 'login'
  skip_before_action :authorize

  def index
    redirect_to home_index_path if User.find_by(id: session[:user_id])
  end

  def login
    user = User.find_by(login: params[:login])
    if user and user.password == params[:password]
      session[:user_id] = user.id
      session[:user_name] = user.firstName + " "+ user.lastName
      session[:user_role] = user.role
      redirect_to home_index_path
    else
      redirect_to login_index_url, alert: "Неверный логин или пароль!"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url, notice: "Сеанс работы завершен!"
  end
end
