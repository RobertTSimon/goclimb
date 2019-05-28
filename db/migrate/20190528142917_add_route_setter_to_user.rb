class AddRouteSetterToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :route_setter, :boolean
  end
end
