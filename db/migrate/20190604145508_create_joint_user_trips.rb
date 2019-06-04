class CreateJointUserTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :joint_user_trips do |t|
    	t.string :status
      t.references :trip, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
