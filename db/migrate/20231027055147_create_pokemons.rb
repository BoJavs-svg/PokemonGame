class CreatePokemons < ActiveRecord::Migration[7.1]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.float :height
      t.float :weight
      t.string :image_url

      t.timestamps
    end
  end
end
