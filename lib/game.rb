class Game

  attr_reader :player_number, :comp_number, :cows, :bulls, :attempts, :score, :bulls_cows_record

  def initialize
    @player_number = []
    @comp_number = choose_comp_number
    @cows  = 0
    @bulls = 0
    @attempts = 0
    @score = []
    @bulls_cows_record = []
  end

  def player_choice(number)
    reset_score
    @number = number
    @player_number = number_array
    calculate_score
  end

  private

  def choose_comp_number
    @number_array = []
    until number_has_4_unique_values(@number_array)
      @number_array = generate_random_4_digit_number
    end
    @number_array
  end

  def number_array number=@number
    number.to_s.split('').map(&:to_i)
  end

  def generate_random_4_digit_number
    number = (0...4).map { |i| rand((i == 0 ? 1 : 0)..9) }.join.to_i
    number_array(number)
  end

  def number_has_4_unique_values(number)
    if number
      number.uniq.length == 4
    end
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
      @score = []
      @attempts = 0
      @comp_number = choose_comp_number
      return "Congratulations! The correct answer was #{@number}"
    end
  end
end
