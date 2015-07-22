class ProvidersController < ApplicationController
  layout 'new_form'
  before_action :set_provider, only: [:show, :edit, :update, :destroy]

  def index
    @providers = Provider.all
  end

  def show
  end

  def new
    @provider = Provider.new
  end

  def edit
  end

  def create
    @provider = Provider.new(provider_params)

    if @provider.save
      redirect_to @provider, notice: 'Поставщик добавлен в систему!'
    else
      render action: 'new'
    end
  end

  def update

    if @provider.update(provider_params)
      redirect_to @provider, notice: 'Данные поставщика успешно обновленны!'
    else
      render action: 'edit'
    end
  end

  def destroy
    @provider.destroy
    redirect_to providers_url
  end

  private
# Use callbacks to share common setup or constraints between actions.
  def set_provider
    @provider = Provider.find(params[:id])
  end

# Never trust parameters from the scary internet, only allow the white list through.
  def provider_params
    params.require(:provider).permit(:name, :address, :phone, :comments, :contact_name)
  end

end
