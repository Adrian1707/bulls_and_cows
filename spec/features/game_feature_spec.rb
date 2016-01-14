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
    expect(current_path).to eq '/play_game'
  end
end