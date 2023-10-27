class PokemonsController < ApplicationController
    def create_random_pokemon
        pokemon_data = PokemonAPI::PokemonClient.get_random_pokemon
    
        if pokemon_data
          # Save the fetched Pokemon data to the database
          @pokemon = Pokemon.create(
            name: pokemon_data.name,
            height: pokemon_data.height,
            weight: pokemon_data.weight,
            image_url: pokemon_data.sprites.front_default
          )
    
     
        else
          p  "Failed to fetch Pokémon data."
        end
    end
end
