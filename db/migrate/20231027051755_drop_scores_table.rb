class DropScoresTable < ActiveRecord::Migration[7.1]
  def change
    if table_exists?(:scores)
      drop_table :scores
    end
  end
end
