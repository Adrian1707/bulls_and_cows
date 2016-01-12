require 'game'
  describe Game do

    let(:game) { Game.new }

    it 'should allow the computer to generate a random 4 digit number' do
      allow(game).to receive(:comp_choice).and_return 5678
      expect(game.comp_choice).to eq(5678)
    end

    it 'should allow the player to chose and score no cows' do
      allow(game).to receive(:comp_choice).and_return 5678
      game.player_choice(1234)
      expect(game.cows).to eq(0)
    end

    it 'should continue game and return scores if number of bulls is less then 4' do
        allow(game).to receive(:comp_number).and_return([5,6,7,8])
        expect(game.player_choice(5671)).to eq("You scored #{game.cows} cows and #{game.bulls} bulls")
    end

    it 'should congratulate the player if they score 4 bulls' do
      allow(game).to receive(:comp_number).and_return([1,2,3,4])
      expect(game.player_choice(1234)).to eq("Congratulations! The correct answer was #{@number}")
    end

    it 'should allow the player to chose and score 3 cows' do
      allow(game).to receive(:comp_number).and_return([5,6,7,8])
      game.player_choice(8562)
      expect(game.cows).to eq(3)
    end

    it 'should reset the cows count on each turn' do
      allow(game).to receive(:comp_number).and_return([5,6,7,8])
      game.player_choice(6723)
      game.player_choice(7190)
      expect(game.cows).to eq(1)
    end

    it 'should reset the bulls count on each turn' do
      allow(game).to receive(:comp_number).and_return([5,6,7,8])
      game.player_choice(5691)
      game.player_choice(1278)
      expect(game.bulls).to eq(2)
    end

    it 'should imcrement the amount of tries after each turn' do
      game.player_choice(5691)
      game.player_choice(1278)
      game.player_choice(1239)
      expect(game.attempts).to eq(3)
    end

    it 'should take a record of all player choices' do
      game.player_choice(5691)
      game.player_choice(1278)
      game.player_choice(1239)
      expect(game.attempts_record).to eq([5691,1278,1239])
    end




  end
