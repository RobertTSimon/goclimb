class AddUserToTrip < ActiveRecord::Migration[5.2]
  def change
    add_reference :trips, :user, foreign_key: true
  end
end
