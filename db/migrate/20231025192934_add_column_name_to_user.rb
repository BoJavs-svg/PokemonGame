class AddColumnNameToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :hints, :integer
  end
end
