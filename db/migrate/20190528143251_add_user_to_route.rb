class AddUserToRoute < ActiveRecord::Migration[5.2]
  def change
    add_reference :routes, :user, foreign_key: true
  end
end
