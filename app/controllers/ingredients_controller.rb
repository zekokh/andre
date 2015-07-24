class IngredientsController < ApplicationController
  layout 'new_form'
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(user_params)

    if @ingredient.save
      redirect_to @ingredient, notice: 'Товар добавлен в систему!'
    else
      render action: 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @ingredient.update(user_params)
      redirect_to @ingredient, notice: 'Данные пользователя успешно обновленны!'
    else
      render action: 'edit'
    end
  end

  def destroy
    @ingredient.destroy
      redirect_to ingredients_url
  end

  def user_params
    params.require(:ingredient).permit(:name, :provider_id, :unit)
  end

  private

  def set_user
    @ingredient = Ingredient.find(params[:id])
  end
end
