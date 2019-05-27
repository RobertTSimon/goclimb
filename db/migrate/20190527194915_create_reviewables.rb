class CreateReviewables < ActiveRecord::Migration[5.2]
  def change
    create_table :reviewables do |t|
      t.references :user, foreign_key: true
      t.references :reviewable,
      t.string :title
      t.text :description
      t.integer :rating

      t.timestamps
    end
  end
end
