class AbilityController < ApplicationController

      def create
        @pokemon = Pokemon.find(params[:pokemon_id])
       
        ability_name = ability_data.ability.name
        @pokemon.abilities.create(name: ability_name) # Create and associate abilities with the specific Pokemon

      
          redirect_to @pokemon, notice: 'Abilities were successfully added.'
        end
      end
    
      private
    
      def ability_params
        params.require(:ability).permit(:name)
      end
end
