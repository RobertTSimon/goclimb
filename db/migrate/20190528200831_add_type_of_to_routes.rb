class AddTypeOfToRoutes < ActiveRecord::Migration[5.2]
  def change
  	add_column :routes, :type_of, :string
  end
end
