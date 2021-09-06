class Admin::HomesController < ApplicationController

  def about
  end

  # def index
  #   @orders = Order.all
  # end

  def index
   case params[:order_sort]
   when "0"
     @orders = Order.all
   when "1"
     @customer = Customer.find(params[:customer_id])
     @orders = @customer.orders
   end
  end


end
