class CreateImageables < ActiveRecord::Migration[5.2]
  def change
    create_table :imageables do |t|
      t.references :imageable, polymorphic: true
      t.string :photo

      t.timestamps
    end
  end
end
