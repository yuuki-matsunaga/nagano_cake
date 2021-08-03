class AddColumnsToOrders < ActiveRecord::Migration[5.0]
  def change

        add_column :orders, :customer_id,    :integer
        add_column :orders, :total_payment,  :integer
        add_column :orders, :status,         :integer
        add_column :orders, :payment_method, :integer
        add_column :orders, :shipping_cost,  :integer
        add_column :orders, :delivery_name,  :string, null: false, default: ""
        add_column :orders, :postal_code,    :string, null: false, default: ""
        add_column :orders, :address,        :string, null: false, default: ""

  end
end
