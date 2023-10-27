class AddIdToPokemons < ActiveRecord::Migration[7.1]
  def change
    unless column_exists?(:pokemons, :id)
      add_column :pokemons, :id, :integer
    end
  end
end
