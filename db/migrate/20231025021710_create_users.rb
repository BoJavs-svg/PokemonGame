class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :points
      t.integer :hints

      t.timestamps
    end
  end
end
