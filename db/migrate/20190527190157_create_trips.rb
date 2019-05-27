class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :start_date
      t.string :end_date
      t.string :weather

      t.timestamps
    end
  end
end
