module StaticPagesHelper

  def save_high_score
    if @game.bulls == 4 && @attempts < @user.high_score
       @user.update_attribute(:high_score, @attempts)
     end
  end

  def load_game
    if a_game_is_already_in_progress?
      @game     = load_game_instance_from_session_hash
      @attempts = @game.attempts
      @result   = load_result_from_session_hash if has_been_at_least_one_attempt?
    else
      @game = Game.new
    end
  end

end
