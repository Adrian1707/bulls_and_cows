require './lib/game'

class HomeController < ApplicationController

  def index
    render "index"
  end

  def new_game
    $game = Game.new
    @comp_choice = $game.comp_choice
    @comp_number = $game.comp_number
    redirect_to '/play_game'
  end

  def play_game
    @result = $result
    render 'game'
  end

  def save_number
    $result = $game.player_choice(params[:number]) #don't understand why this @game variable is not responding to method calls
    @player_number = $game.player_number
    p @player_number
    p @result
    redirect_to '/game'
  end

end
