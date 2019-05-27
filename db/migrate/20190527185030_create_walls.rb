class CreateWalls < ActiveRecord::Migration[5.2]
  def change
    create_table :walls do |t|
      t.references :site, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
