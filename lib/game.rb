class Game

  attr_accessor :player_number, :comp_number, :cows, :bulls

  def initialize
    @player_number = []
    @comp_number = []
    @cows = 0
    @bulls = 0
  end


  def player_choice(number)
    @player_number = number.to_s.split('').map(&:to_i)
    has_cows?
    has_bulls?
  end

  def has_bulls?
    @player_number.each_with_index do |x,i|
      if @player_number[i] == @comp_number[i]
        @bulls+=1
      end
    end
    @bulls
  end

  def comp_choice
    number = (0...4).map { |i| rand((i == 0 ? 1 : 0)..9) }.join.to_i
    @comp_number = number.to_s.split('').map(&:to_i)
  end

  # private

  def has_cows?
    @player_number.each do |x|
      if @comp_number.include?(x)
        @cows+=1
      end
    end
    @cows
  end

end

# num = 1234

# print num.to_s.split('').map(&:to_i)
#
# game = Game.new
#
# print game.comp_choice
#
# game.player_choice(1234)
#
# print game.player_number
#
# print game.bulls
