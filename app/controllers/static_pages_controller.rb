require './lib/game'

class StaticPagesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def home
  end

  def game
    if session[:game]
      @game = YAML::load(session[:game])
    else
      @game = Game.new
    end

    @comp_choice = @game.comp_choice
    @comp_number = @game.comp_number
    @result = YAML::load(session[:result]) if session[:result]
    @attempts = @game.attempts if session[:game]
    @comp_number = @game.comp_number
    p "COMP NUMBER:"
    p @comp_number
    session[:game] = @game.to_yaml
  end

  def save_number
    game = YAML::load(session[:game])
    session[:result] = game.player_choice(params[:number]).to_yaml
    session[:game] = game.to_yaml
    redirect_to game_path
  end
end