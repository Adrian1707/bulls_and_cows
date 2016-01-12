class HomeController < ApplicationController

  def index
    render "index"
  end

  def new_game
    render 'game'
  end


  def after_sign_in_path_for(resource)
  game_path || stored_location_for(resource) || root_url
end


end
