class AddColumnsToItems < ActiveRecord::Migration[5.0]
  def change

    add_column :items, :genre_id, :integer
    add_column :items, :name, :string, null: false, default: ""
    add_column :items, :image_id, :string, null: false, default: ""
    add_column :items, :introduction, :text, null: false, default: ""
    add_column :items, :price, :integer
    add_column :items, :is_active, :boolean, null: false, default: true

  end
end
