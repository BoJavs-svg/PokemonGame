class PokemonsController < ApplicationController
    def create_random_pokemon
        pokemon_data = PokemonAPI::PokemonClient.get_random_pokemon
    
        if pokemon_data
            existing_pokemon = Pokemon.find_by(name: pokemon_data.name)
      
            if existing_pokemon
                # Pokémon already exists, do something (e.g., show a message, redirect)
                p "Pokémon #{pokemon_data.name} already exists in the database."
                redirect_to root_path
            else
          # Save the fetched Pokemon data to the database
            @pokemon = Pokemon.create(
                name: pokemon_data.name,
                height: pokemon_data.height,
                weight: pokemon_data.weight,
                image_url: pokemon_data.sprites.front_default,
                idP: pokemon_data.id
            )

            if @pokemon.valid?
                # Create abilities for the created Pokemon
                create_abilities_for(@pokemon, pokemon_data.abilities)
                else
                    p "Failed to save Pokémon data."
                    return nil
                end
            end
        else
          p  "Failed to fetch Pokémon data."
          return nil
        end

        @pokemon
    end

    private 
    def create_abilities_for(pokemon, abilities_data)
        abilities_data.each do |ability_data|
          # Extract ability name from API response
          ability_name = ability_data.ability.name
    
          # Create ability and associate it with the given Pokemon
          Ability.create(
            name: ability_name,
            pokemon: pokemon
          )
        end
      end
end
