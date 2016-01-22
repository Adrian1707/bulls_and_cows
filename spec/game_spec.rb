require 'game'
  describe Game do

    let(:game) { Game.new }


    it "has a random 4 digit 'comp choice' when initialized" do
      expect(game.comp_number).to be_a Array
      expect(game.comp_number.length).to eq 4
    end

    it 'should allow the player to chose and score no cows' do
      allow_any_instance_of(Game).to receive(:choose_comp_number).and_return [5, 6, 7, 8]
      game.player_choice(1234)
      expect(game.cows).to eq(0)
    end

    it 'should continue game and return scores if number of bulls is less then 4' do
      allow(game).to receive(:comp_number).and_return([5,6,7,8])
      expect(game.player_choice(5671)).to eq("You scored #{game.cows} cows and #{game.bulls} bulls")
    end

    it 'should congratulate the player if they score 4 bulls' do
      allow(game).to receive(:comp_number).and_return([1,2,3,4])
      expect(game.player_choice(1234)).to eq("Congratulations! The correct answer was 1234")
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

    xit 'should imcrement the amount of tries after each turn' do
      game.player_choice(5691)
      game.player_choice(1278)
      game.player_choice(1239)
      expect(user.high_score).to eq(3)
    end

    xit 'should reset computer number when bulls reaches 4' do
      allow(game).to receive(:comp_number).and_return([5,6,7,8])
      game.player_choice(5691)
      game.player_choice(5678)
      expect(game.comp_number).not_to eq([5,6,7,8])
    end


  end
