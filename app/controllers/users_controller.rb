class UsersController < ApplicationController
  helper_method :user
  before_action :admin_user?
  layout 'new_form'

  def index
    @users = User.page(params[:page]).per(10)
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: 'Пользоватлеь добавлен в систему!'
    else
      render action: 'new'
    end
  end

  def update
    if user.update_attributes(user_params)
      redirect_to user_path(user), notice: 'Данные пользователя успешно обновленны!'
    else
      render action: 'edit'
    end
  end

  def destroy
    if user.destroy
      redirect_to users_url
    else
      #todo redirect with error
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def user
    @user ||= User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:firstName, :lastName, :sessions, :password, :birthday, :phone, :role)
  end

  protected

  def admin_user?
    return if current_user.admin?
    redirect_to home_index_path, notice: "У Вас не достаточно прав, обратитесь к администратору системы!"
  end
end
