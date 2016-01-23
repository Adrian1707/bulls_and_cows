require 'rails_helper'

feature 'Game Features' do
  let(:user){ User.create(email: "testuser1@email.com", password: "password", password_confirmation: "password") }

  before :each do
    visit('/')
    click_link('Sign in')
    fill_in('Email', with: "#{user.email}")
    fill_in('Password', with: "#{user.password}")
    click_button('Log in')
  end

  context 'when computer chooses 1234' do
    before(:each){ allow_any_instance_of(Game).to receive(:comp_number).and_return [1, 2, 3, 4] }

    context 'if Player chooses 3421' do
      before :each do
        fill_in "number", with: '3421'
        click_button 'Play'
      end

      it 'Player scores 4 cows' do
        expect(current_path).to eq game_path
        expect(page).to have_content "You scored 4 cows"
      end

      it 'shows 1 attempt has been made' do
        expect(page).to have_content '1 attempt'
      end

      context 'when Player repeats the same numbers' do
        before :each do
          fill_in "number", with: '3421'
          click_button 'Play'
        end

        it 'shows that 2 attempts have been made' do
          expect(page).to have_content '2 attempts'
        end
      end

      context 'when Player chooses correct numbers' do
        it 'player is congratulated' do
          fill_in "number", with: '1234'
          click_button 'Play'
          expect(page).to have_content "Congratulations! The correct answer was 1234"
        end
      end
    end

    context 'if Player chooses 1243' do
      it 'Player scores 4 cows and 2 bulls' do
        fill_in "number", with: '1243'
        click_button 'Play'
        expect(current_path).to eq game_path
        expect(page).to have_content "You scored 4 cows and 2 bulls"
      end
    end

    context 'should be allowed to restart the game' do

      it 'should reset score when player clicks restart' do
        fill_in "number", with: '1243'
        click_button "Play"
        click_button "Restart Game"
        expect(page).not_to have_content("You've had 1 attempts")
      end
    end

    context 'leadership board' do
      it 'should display the high scores of all players' do
        fill_in "number", with: '1243'
        click_button "Play"
        fill_in "number", with: '1267'
        click_button "Play"
        fill_in "number", with: '1234'
        click_button "Play"
        expect(page).to have_content("testuser1@email.com")
        expect(page).to have_content("3 attempts")
      end
    end

  end
end
