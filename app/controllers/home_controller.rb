require './lib/game'

class HomeController < ApplicationController

  def index
    render "index"
  end

  def new_game
    session[:game] = Game.new
    @game = session[:game]
    @comp_choice = @game.comp_choice
    @comp_number = @game.comp_number
    redirect_to '/play_game'
  end

  def play_game
    @result = session[:result]
    # @attempts = @game.attempts
    # @attempts_record = @game.attempts_record
    @comp_number = @game.comp_number
    render 'game'
  end

  def save_number
    session[:result] = @game.player_choice(params[:number]) #don't understand why this @game variable is not responding to method calls
    p session[:result]
    redirect_to '/play_game'
  end

end
