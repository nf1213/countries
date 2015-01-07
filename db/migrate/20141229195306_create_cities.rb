class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name, null: false
      t.integer :country_id, null: false
      t.integer :rating
    end
  end
end
