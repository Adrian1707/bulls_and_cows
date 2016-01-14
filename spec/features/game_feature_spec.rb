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

  it 'user can play game' do
    fill_in "number", with: '1234'
    click_button 'Play'
    expect(current_path).to eq game_path
    #another or a different assertion needs to go here, but I don't know what the app is supposed to do once this bug has been fixed so I've left it at this for now
  end
end