class CreateImageables < ActiveRecord::Migration[5.2]
  def change
    create_table :imageables do |t|
      t.references :imageable_id, foreign_key: true
      t.string :link_photo

      t.timestamps
    end
  end
end
