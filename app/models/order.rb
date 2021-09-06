class Order < ApplicationRecord

  has_many :order_details, dependent: :destroy
  belongs_to :customer

  # def full_address
  #   self. ("〒" + postal_code + " " + self.address)
  # end

  def with_tax_price
    (price * 1.1).floor
  end


  def subtotal
    item.with_tax_price * amount
  end

  enum status: [:wait_for_payment, :confirm_payment, :producing, :ready_to_ship, :complete_ship]

  enum payment_method: { credit_card: 0, transfer: 1 }


end
