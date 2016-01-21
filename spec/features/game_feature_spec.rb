require 'rails_helper'

feature 'Game Features' do
  let(:user){ User.create(email: "user@email.com", password: "password", password_confirmation: "password") }

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

        it 'should restart the game when player wins' do
          fill_in "number", with: '4321'
          click_button 'Play'
          fill_in "number", with: '1234'
          click_button 'Play'
          expect(page).not_to have_content '4321: 4 cows and 0 bulls'
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
  end
end
