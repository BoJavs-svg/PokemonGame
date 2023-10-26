class AddColumnNameToUser < ActiveRecord::Migration[7.1]
  def change
    unless column_exists?(:users, :hints)
      add_column :users, :hints, :integer
    end
  end
end
