class AddLocationAndFavoriteToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :location, :string
    add_column :users, :favorite, :string
  end
end
