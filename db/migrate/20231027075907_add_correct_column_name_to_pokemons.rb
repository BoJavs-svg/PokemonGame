class AddCorrectColumnNameToPokemons < ActiveRecord::Migration[7.1]
  def change
    add_column :pokemons, :idP, :integer

    # Copy data from the old column to the new one
    Pokemon.all.each do |pokemon|
      pokemon.update(idP: pokemon.id)
    end
  end
end
