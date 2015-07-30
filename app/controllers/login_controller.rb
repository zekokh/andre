class LoginController < ApplicationController
  layout 'login'
  skip_before_action :authorize

  def index
    redirect_to home_index_path if User.find_by(id: session[:user][:id]) unless session[:user][:id].nil?
  end

  def login
    user = User.find_by(login: params[:login])
    if user && user.password == params[:password]
      session[:user] = { id: user.id, name: "#{user.firstName} #{user.lastName}", role: user.role }
      redirect_to home_index_path
    else
      redirect_to login_index_url, alert: "Неверный логин или пароль!"
    end
  end

  def destroy
    session[:user][:id] = nil
    redirect_to login_url, notice: "Сеанс работы завершен!"
  end
end
