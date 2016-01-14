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
    @score = $game.score
    @attempts = $game.attempts
    @bulls_cows_track = $game.bulls_cows_record
    @comp_number = $game.comp_number
    render 'game'
  end

  def save_number
    $result = $game.player_choice(params[:number])
    redirect_to '/play_game'
  end

end
