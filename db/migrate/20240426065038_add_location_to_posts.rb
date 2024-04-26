class AddLocationToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :location_name, :string
    add_column :posts, :address, :string
  end
end
