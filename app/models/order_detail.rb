class OrderDetail < ApplicationRecord

  belongs_to :item
  belongs_to :order

  enum making_status: [:not_startable, :wait, :producing, :complete]

  def subtotal
    item.with_tax_price * amount
  end

  def with_tax_price
    (price * 1.1).floor
  end

end
