require './lib/game'

class HomeController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    render "index"
  end

  def play_game
    game = Game.new
    @comp_choice = game.comp_choice
    @comp_number = game.comp_number
    session[:game] = game
    @result = session[:result]
    @comp_number = session[:game].comp_number
    render 'game'
  end

  def save_number
    session[:result] = session[:game].player_choice(params[:number])
    redirect_to '/play_game'
  end
end