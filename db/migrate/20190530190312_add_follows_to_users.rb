class AddFollowsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :following, :integer, array: true, default: []
    add_column :users, :followed_by, :integer, array: true, default: []
  end
end
