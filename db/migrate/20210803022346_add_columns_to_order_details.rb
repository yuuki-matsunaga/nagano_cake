class AddColumnsToOrderDetails < ActiveRecord::Migration[5.0]
  def change

    add_column :order_details, :order_id,      :integer
    add_column :order_details, :item_id,       :integer
    add_column :order_details, :amount,        :integer
    add_column :order_details, :price,         :integer
    add_column :order_details, :making_status, :integer

  end
end
