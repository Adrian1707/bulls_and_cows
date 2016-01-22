module StaticPagesHelper
  def save_high_score
    if @game.bulls == 4 && @attempts < @user.high_score
       @user.update_attribute(:high_score, @attempts)
     end
  end
end
