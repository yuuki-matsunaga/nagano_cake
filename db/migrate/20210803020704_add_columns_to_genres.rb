class AddColumnsToGenres < ActiveRecord::Migration[5.0]
  def change
    add_column :genres, :name, :string, null: false, default: ""
  end
end
