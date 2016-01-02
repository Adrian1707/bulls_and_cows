require 'game'
  describe Game do

    let(:game) { Game.new }

    it 'should allow the player to store a 4 digit number' do
      game.player_choice(1234)
      expect(game.player_number).to eq(1234)
    end

  end
