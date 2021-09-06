class Public::OrdersController < ApplicationController

  def index
    @orders = current_customer.orders
  end

  def new
    @order = Order.new
    @customer = current_customer
    @address = Address.new
  end

  def confirm
    if params[:order][:select_address] == "0"
      @order = Order.new(order_params)
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.delivery_name = current_customer.first_name + current_customer.last_name

    elsif params[:order][:select_address] == "1"
      @order = Order.new(order_params)
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.delivery_name = @address.name

    elsif params[:order][:select_address] == "2"
      @order = Order.new(order_params)
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.delivery_name = params[:order][:delivery_name]
      @address = Address.new
      @address.customer_id = current_customer.id
      @address.name = params[:order][:delivery_name]
      @address.postal_code = params[:order][:postal_code]
      @address.address = params[:order][:address]
      @address.save
    end

    @cart_items = current_customer.cart_items
    @total = 0
    @cart_items.each do |cart_item|
      @total += cart_item.subtotal
    end

  end


  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.status = "wait_for_payment"
    @order.save
    @cart_items = current_customer.cart_items
    @cart_items.each do |x|
      @order_detail = OrderDetail.new
      @order_detail.order_id = @order.id
      @order_detail.item_id = x.item_id
      @order_detail.amount = x.amount
      @order_detail.price = x.item.price
      @order_detail.save
    end
    @cart_items.destroy_all
    redirect_to orders_thanks_path
  end

  def thanks

  end

  def show
    @orders = Order.all
    @order = Order.find(params[:id])
    # @cart_items = current_customer.cart_items


  end

  private



  def order_params
    params.require(:order).permit(:customer_id, :delivery_name, :postal_code, :address, :payment_method)
  end

  def order_detail_params
    params.requier(:order_detail).permit(:order_id, :item_id, :amount, :price)
  end

end
