class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :admin_role
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
    if @user.update(user_params)
      redirect_to @user, notice: 'Данные пользователя успешно обновленны!'
    else
      render action: 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:firstName, :lastName, :login, :password, :birthday, :phone, :role)
  end

  protected

  #To check user role
  def admin_role
    redirect_to home_index_url, notice: "У Вас не достаточно прав, обратитесь к администратору системы!" if session[:user_role] == "user"
  end
end
