class AddBioLocationStyleLevelFriendsTripsToUser < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :location, :string
  	add_column :users, :bio, :text
  	add_column :users, :favorite_styles, :string
  	add_column :users, :current_level, :string
  end
end
