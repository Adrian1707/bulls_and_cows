require 'rails_helper'

  feature 'playing a game' do
    before do
      visit('/')
      click_link('Sign up')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button('Sign up')
    end
    context 'entering a number' do
      it 'should have player score on submission of number' do
      fill_in('number', with: '1256')
      click_button("Play")
      expect(page).to have_content("You scored 2 cows and 2 bulls")
      end
    end
  end
