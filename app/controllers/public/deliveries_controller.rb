class Public::DeliveriesController < ApplicationController

  def index
    @deliveries = current_customer.addresses
    @delivery = Address.new
  end

  def edit
    @delivery = Address.find(params[:id])
  end

  def create
    @delivery = Address.new(address_params)
    @delivery.customer_id = current_customer.id
    @delivery.save
    redirect_to deliveries_path
  end

  def update
    @delivery = Address.find(params[:id])
    @delivery.customer_id = current_customer.id
    @delivery.update(address_params)
    redirect_to deliveries_path
  end

  def destroy
    @delivery = Address.find(params[:id])
    @delivery.destroy
    redirect_to deliveries_path
  end

  private

  def address_params
    params.require(:address).permit(:name, :postal_code, :address)
  end

end
