class Admin::OrderDetailsController < ApplicationController

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order_detail.order.order_details

    if @order_detail.update(order_detail_params)
      if @order_detail.making_status == "producing"
        @order.status = "producing"
        @order.save
      elsif @order_details.where(making_status: "complete").count == @order_details.count
        @order.status = "ready_to_ship"
        @order.save
      end
    end
    @order_detail.update(order_detail_params)
    redirect_to admin_order_path(@order)
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end

end
