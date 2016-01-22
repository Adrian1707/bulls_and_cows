require 'rails_helper'

  feature 'display content' do
    let(:user){ User.create(email: "testuser1@email.com", password: "password", password_confirmation: "password") }

    before :each do
      visit('/')
      click_link('Sign in')
      fill_in('Email', with: "#{user.email}")
      fill_in('Password', with: "#{user.password}")
      click_button('Log in')
    end

    context 'when game is in session' do
      it 'should offer a sign out link' do
        expect(page).to have_content "Sign out"
      end

      it 'should have link to new game on root page if signed in' do
        visit root_path
        click_link "Start game"
        expect(current_path).to eq game_path
      end
    end

  end
