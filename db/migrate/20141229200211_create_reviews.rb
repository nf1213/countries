class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :city_id, null: false
      t.integer :user_id, null: false
      t.integer :food_rating, null: false
      t.integer :nightlife_rating, null: false
      t.integer :landmark_rating, null: false
      t.integer :cost_rating, null: false
      t.integer :weather_rating, null: false
      t.integer :culture_rating, null: false
      t.float :overall_rating
      t.text :description

      t.timestamps
    end
  end
end
