class CreateFavouriteRoutes < ActiveRecord::Migration[5.2]
  def change
    create_table :favourite_routes do |t|
      t.references :route, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
