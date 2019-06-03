class AddAlertsToReviews < ActiveRecord::Migration[5.2]
  def change
  	add_column :reviews, :alert, :string
  	add_column :reviews, :fixed, :boolean, default: false

  end
end
