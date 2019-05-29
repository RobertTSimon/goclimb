class RemovePolimorphicFromReviews < ActiveRecord::Migration[5.2]
  def change
  	remove_reference :reviews, :reviewable
  	add_reference :reviews, :route, foreign_key: true
  end
end
