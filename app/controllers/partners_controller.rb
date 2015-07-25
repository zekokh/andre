class PartnersController < ApplicationController
  layout 'new_form'
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :admin_role

  def index
    @partners = Partner.page(params[:page]).per(10)
  end

  def show
  end

  def new
    @partner = Partner.new
  end

  def edit
  end

  def create
    @partner = Partner.new(user_params)

    if @partner.save
      redirect_to @partner, notice: 'Партнер добавлен в систему!'
    else
      render action: 'new'
    end
  end

  def update
    if @partner.update(user_params)
      redirect_to @partner, notice: 'Данные пользователя успешно обновленны!'
    else
      render action: 'edit'
    end
  end

  def destroy
    @partner.destroy
    redirect_to partners_url
  end

private

def set_user
  @partner = Partner.find(params[:id])
end

def user_params
  params.require(:partner).permit(:name, :contact_name, :phone, :address, :comments)
end

protected

def admin_role
  redirect_to home_index_url, notice: "У Вас не достаточно прав, обратитесь к администратору системы!" if session[:user_role] == "user"
end

end
