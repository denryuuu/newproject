class RenameAvatarToImageInPosts < ActiveRecord::Migration[7.1]
  def change
    rename_column :posts, :avatar, :image
  end
end
