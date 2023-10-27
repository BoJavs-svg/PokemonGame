#lib\assets\pokemon\pokemon_client.rb
require 'poke-api-v2'
module PokemonAPI
    class PokemonClient
        def self.get_random_pokemon
            random_id = rand(1..1000) # Adjust the range as needed
            response = PokeApi.get(pokemon: random_id)
            if response
               p response
                return response
            else
                return nil
            end
        end
    end
end