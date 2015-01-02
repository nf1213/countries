class OptionalUserColumns < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :country_of_origin, :string
    add_column :users, :age, :integer
    add_column :users, :gender, :string
    add_column :users, :about, :text

    change_column_null :users, :username, false
  end
end
