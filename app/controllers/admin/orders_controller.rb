class Admin::OrdersController < ApplicationController


  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details

  end

  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details

    if @order.update(order_params)
      if @order.status == "confirm_payment"
         @order_details.each do |order_detail|
         order_detail.making_status = "wait"
         order_detail.save
      end
      end
    end
    @order.update(order_params)
    redirect_to admin_order_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end

end
