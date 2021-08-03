class AddColumnsToAddresses < ActiveRecord::Migration[5.0]
  def change

    add_column :addresses, :name, :string, null: false, default: ""
    add_column :addresses, :postal_code, :string, null: false, default: ""
    add_column :addresses, :address, :string, null: false, default: ""

  end
end
