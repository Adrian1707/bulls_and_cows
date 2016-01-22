require 'rails_helper'

  RSpec.describe User, type: :model do
    feature 'Game Features' do
      let(:user){ User.create(email: "testuser@email.com", password: "password", password_confirmation: "password") }

      before :each do
        visit('/')
        click_link('Sign in')
        fill_in('Email', with: "#{user.email}")
        fill_in('Password', with: "#{user.password}")
        click_button('Log in')
      end

        before(:each){ allow_any_instance_of(Game).to receive(:comp_number).and_return [1, 2, 3, 4] }
        it 'should record a high score of 3 after 3 attempts' do
            fill_in "number", with: '1243'
            click_button "Play"
            fill_in "number", with: '1423'
            click_button "Play"
            fill_in "number", with: '1234'
            click_button "Play"
            # expect(page).to have_content "You've had 3 attempts"
            # expect(page).to have_content "Congratulations! The correct answer was 1234"
            p user
            expect(user.high_score).to eq(3)
        end
    end
  end
