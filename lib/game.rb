class Game

  attr_reader :player_number, :comp_number, :cows, :bulls, :attempts, :score, :bulls_cows_record

  def initialize
    @player_number = []
    @comp_number = []
    @cows  = 0
    @bulls = 0
    @attempts = 0
    @score = []
    @bulls_cows_record = []
  end

  def player_choice(number)
    reset_score
    @player_number = number.to_s.split('').map(&:to_i)
    @number = number
    calculate_score
  end

  def comp_choice
    until number_has_4_unique_values
    @number = generate_random_4_digit_number
    @comp_number = number_array
    end
  end

  private

  def number_array
    @number.to_s.split('').map(&:to_i)
  end

  def generate_random_4_digit_number
    (0...4).map { |i| rand((i == 0 ? 1 : 0)..9) }.join.to_i
  end

  def number_has_4_unique_values
     @comp_number.uniq.length == 4
  end

  def increase_attempts
    @attempts += 1
  end

  def reset_score
    @cows = 0
    @bulls = 0
  end

  def count_cows
    @player_number.each do |x|
      if comp_number.include?(x)
        @cows += 1
      end
    end
  end

  def count_bulls
    @player_number.each_with_index do |x,i|
      if @player_number[i] == self.comp_number[i]
        @bulls+=1
      end
    end
  end

  def calculate_score
    count_cows
    count_bulls
    increase_attempts
    @score << ["#{@number}: #{@cows} cows and #{@bulls} bulls"]
    result
  end

  def result
    if @bulls < 4
      return "You scored #{@cows} cows and #{@bulls} bulls"
    else
      return "Congratulations! The correct answer was #{@number}"
    end
  end

end





# num = 1234

# print num.to_s.split('').map(&:to_i)

# game = Game.new
#
# print game.comp_choice
# print game.comp_number
# game.player_choice(1256)
# print game.player_number
# print game.cows
# print game.bulls
#
# game.player_choice(1234)
#
# print game.player_number
#
# print game.bulls
