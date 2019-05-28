class RenameImageablesToPhotos < ActiveRecord::Migration[5.2]
  def change
  	rename_table :imageables, :photos
  end
end
