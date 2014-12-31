class RemoveColumnNameFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :age, :integer
  end
end
