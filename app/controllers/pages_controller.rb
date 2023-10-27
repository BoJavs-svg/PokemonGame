require_relative '../../lib/assets/pokemon/pokemon_client'

class PagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  

  def inicio
  end

  def create_user
    @user = User.new(name: params[:name],points: 0,hints: -1)
    if @user.save
      p @user.id
      redirect_to pages_main_path(id: @user.id)
    end
  end 

  def main
    @user = User.find_by(id: params[:id])
    @pokemon = PokemonsController.new.create_random_pokemon
    abilities = @pokemon.abilities.map { |ability| ability.name }
    @items = ["Weight " + @pokemon.weight.to_s, "Height " + @pokemon.height.to_s, "Abilities: " + abilities.join(", "),
              "Id "+@pokemon.idP.to_s]    
     @points_to_deduct = 0
  end

  def update_hint
    @user = User.find_by(id: params[:id])
    @user.hints += 1
    @user.save
    
    render json: { hints:params[:items][0..@user.hints] }
  end

  def update_points
    @user = User.find_by(id: params[:id])
    @user.points += params[:points].to_i
  
    @user.save
    render json: { points: @user.points }
  end
    

end
