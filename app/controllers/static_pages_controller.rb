require './lib/game'

class StaticPagesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def home
  end

  def game
    game = Game.new
    @comp_choice = game.comp_choice
    @comp_number = game.comp_number
    @result = session[:result]
    @comp_number = game.comp_number
    session[:game] = game.to_yaml
  end

  def save_number
    game = YAML::load(session[:game])
    session[:result] = game.player_choice(params[:number])
    redirect_to game_path
  end
end