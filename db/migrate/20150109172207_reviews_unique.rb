class ReviewsUnique < ActiveRecord::Migration
  def change
    add_index :reviews, [:city_id, :user_id], unique: true
  end
end
