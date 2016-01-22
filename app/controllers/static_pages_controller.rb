require './lib/game'

class StaticPagesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def home
  end

  def game
    @user = current_user
    Rails.logger.info(@user.errors.messages.inspect)
    if a_game_is_already_in_progress?
      @game     = load_game_instance_from_session_hash
      @attempts = @game.attempts
      if @game.bulls == 4 
         @user.update_attribute(:high_score, @attempts)
       end
      @result   = load_result_from_session_hash if has_been_at_least_one_attempt?
    else
      @game = Game.new
    end
    @score = @game.score
    save_game_instance_into_session(@game)
  end

  def save_number
    game = load_game_instance_from_session_hash
    result = calculate_result(game, params)
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
