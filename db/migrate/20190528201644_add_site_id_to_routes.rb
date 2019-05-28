class AddSiteIdToRoutes < ActiveRecord::Migration[5.2]
  def change
  	add_column :routes, :site_id, :integer
  	add_foreign_key :routes, :sites
  end
end
