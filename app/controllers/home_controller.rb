require './lib/game'

class HomeController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    render "index"
  end

  def new_game
    session[:game] = Game.new
    @comp_choice = session[:game].comp_choice
    @comp_number = session[:game].comp_number
    p session[:game].class
    redirect_to '/play_game'
  end

  def play_game
    @result = session[:result]
    # p session[:game]
    # @attempts = @game.attempts
    # @attempts_record = @game.attempts_record
    @comp_number = session[:game]["comp_number"]
    # p session[:game]
    # p @comp_number
    render 'game'
  end

  def save_number
    p session[:game].class #for some reason the session has been converted into a hash whereas in line 14 it's an object
    session[:result] = session[:game].comp_choice #why doesn't it understand comp_choice here when it does in line 12?
    # p session[:result]
    redirect_to '/play_game'
  end

end
