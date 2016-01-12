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
    @attempts = $game.attempts
    @attempts_record = $game.attempts_record
    @comp_number = $game.comp_number
    render 'game'
  end

  def save_number
    $result = $game.player_choice(params[:number]) #don't understand why this @game variable is not responding to method calls
    redirect_to '/play_game'
  end

end
