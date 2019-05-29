class RenameReviewablesToReviews < ActiveRecord::Migration[5.2]
  def change
  	rename_table :reviewables, :reviews
  end
end
