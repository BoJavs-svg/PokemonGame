class PagesController < ApplicationController
  before_action :set_items
  skip_before_action :verify_authenticity_token


  def inicio
  end
  # TODO fix button so that is shows correctly in the html file
  def update_hint
    puts @i
    head :no_content 

  end

  def create_user
    @user = User.new(name: params[:name],points: 0,hints: 0)
    if @user.save
      p @user.id
      redirect_to pages_main_path(id: @user.id)
    end
  end 

  def main
    @user = User.find_by(id: params[:id])
  end

  def update_hint
    @user = User.find_by(id: params[:id])
    @user.hints += 1
    @user.save
    p @user.hints
    render json: { hints: @items[0..@user.hints] }
  end

  def set_items
    @items = ["item 1", "item 2", "item 3", "item 4", "item 5", "item 6", "item 7", "item 8", "item 9", "item 10"]
  end

end
