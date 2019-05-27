class CreateRouteTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :route_trips do |t|
      t.references :route, foreign_key: true
      t.references :trip, foreign_key: true

      t.timestamps
    end
  end
end
