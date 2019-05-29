class RemoveReviewablesFromSchema < ActiveRecord::Migration[5.2]
  def change
  	remove_column :reviews, :reviewable_type
  end
end
