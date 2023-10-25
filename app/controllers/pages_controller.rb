class PagesController < ApplicationController
  def inicio
    @items = ["item 1", "item 2", "item 3", "item 4", "item 5", "item 6", "item 7", "item 8", "item 9", "item 10"]
  end
  # TODO fix button so that is shows correctly in the html file
  def update_hint
    puts @i
    head :no_content 

  end

  def create_user
    # Params {"authenticity_token"=>"dvYJQOaWaL1gzLmsXR8vRT7NMbzgnNWmxwP1vu1MyEs-b1SFtuXa8RfmIlT5iShsv0oluw50CTS26-H2GKcCQQ", "name"=>"javs", "commit"=>"Submit", "controller"=>"pages", "action"=>"create_user"}
    @user = User.new(name: params[:name],points: 0,hints: 0)
    @user.save
  end 



end
