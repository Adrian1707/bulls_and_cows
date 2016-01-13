require './lib/game'

class HomeController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    render "index"
  end

  def new_game
    game = Game.new
    "GAME.CLASS FROM INSIDE NEW_GAME METHOD:"
    p game.class
    @comp_choice = game.comp_choice
    p "COMP_CHOICE FROM INSIDE NEW_GAME:"
    p @comp_choice
    @comp_number = game.comp_number
    p "COMP_NUMBER FROM INSIDE NEW_GAME:"
    p @comp_number
    session[:game] = game
    p "SESSION[:game] FROM INSIDE NEW_GAME METHOD:"
    p session[:game]
    session[:hello] = "hello"
    redirect_to '/play_game'
  end

  def play_game
    @result = session[:result]
    # @attempts = @game.attempts
    # @attempts_record = @game.attempts_record
    p session[:game].inspect
    @comp_number = session[:game]["comp_number"]
    render 'game'
  end

  def save_number
    p "SESSION[:GAME] FROM INSIDE SAVE_NUMBER:"
    p session[:game]
    p "SESSION[:GAME].CLASS FROM INSIDE SAVE_NUMBER:"
    p session[:game].class
    p "SESSION[:HELLO]:"
    p session[:hello]
    game = Game.new
    game.comp_number = session["comp_number"]
    game.cows = session["cows"]
    game.bulls = session["bulls"]
    game.attempts = session["attempts"]
    session[:result] = game.player_choice(params[:number]) #don't understand why this @game variable is not responding to method calls
    redirect_to '/play_game'
  end

end
