class AddAvatarPhotoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :avatar_photo, :string
  end
end
