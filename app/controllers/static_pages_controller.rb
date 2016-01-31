require './lib/game'

class StaticPagesController < ApplicationController
  include StaticPagesHelper
  skip_before_filter :verify_authenticity_token

  def home
  end

  def game
    @users = User.all
    @user = current_user
    load_game
    load_instance_variables
    save_high_score
    @high_score = @user.high_score
    save_game_instance_into_session(@game)
  end

  def save_number
    game = load_game_instance_from_session_hash
    result = calculate_result(game, params)
    session[:choice_history] = game.choice_history
    session[:bulls_history] = game.bulls_history
    session[:cows_history] = game.cows_history
    save_result_into_session(result)
    save_game_instance_into_session(game)
    redirect_to game_path
  end

  def restart_game
    session[:game] = nil
    redirect_to game_path
  end

  private

  def save_game_instance_into_session game
    session[:game] = game.to_yaml
  end

  def load_instance_variables
    @score = @game.score
    @player_number = @game.player_number
    @choice_history = session[:choice_history]
    @bulls_history = session[:bulls_history]
    @cows_history = session[:cows_history]
  end 

  def save_result_into_session result
    session[:result] = result
  end

  def calculate_result(game, params)
    game.player_choice(params[:number]).to_yaml
  end

  def has_been_at_least_one_attempt?
    session[:result]
  end

  def load_result_from_session_hash
    YAML::load(session[:result])
  end

  def a_game_is_already_in_progress?
    session[:game]
  end

  def load_game_instance_from_session_hash
    YAML::load(session[:game])
  end
end
