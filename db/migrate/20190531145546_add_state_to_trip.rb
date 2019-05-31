class AddStateToTrip < ActiveRecord::Migration[5.2]
  def change
    add_column :trips, :state, :string
  end
end
