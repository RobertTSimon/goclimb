class RemoveDateFromTrips < ActiveRecord::Migration[5.2]
  def change
  	 remove_column :trips, :start_date
  	 remove_column :trips, :end_date
  end
end
