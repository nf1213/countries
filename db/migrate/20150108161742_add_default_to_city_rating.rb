class AddDefaultToCityRating < ActiveRecord::Migration
  def up
    change_column :cities, :rating, :integer, default: 0
  end

  def down
    change_column :cities, :rating, :integer, default: nil
  end
end
