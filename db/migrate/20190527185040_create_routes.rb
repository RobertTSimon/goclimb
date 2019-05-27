class CreateRoutes < ActiveRecord::Migration[5.2]
  def change
    create_table :routes do |t|
      t.string :name
      t.float :longitude
      t.float :latitude
      t.text :description
      t.string :type
      t.string :style
      t.string :level
      t.integer :rating

      t.timestamps
    end
  end
end
