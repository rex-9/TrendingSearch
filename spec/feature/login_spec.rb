require 'rails_helper'

RSpec.describe 'Log in', type: :feature do
  describe 'index page for users' do
    it 'has the "Log in" button' do
      visit user_session_path
      expect(page).to have_content 'Log in'
    end

    it 'has password and username inputs' do
      visit user_session_path
      expect(page).to have_field 'Username'
      expect(page).to have_field 'Password'
    end

    it 'displays an error when submitting without filling the fields' do
      visit user_session_path
      click_button 'Log in'
      expect(page).to have_content 'Invalid Username or password.'
    end

    it 'displays an error when submitting an incorrect Username or password' do
      User.create(
        username: 'Rex',
        password: 'correctpassword'
      )

      visit user_session_path
      fill_in 'Username', with: 'Rx'
      fill_in 'Password', with: 'wrongpassword'
      click_button 'Log in'
      expect(page).to have_content 'Invalid Username or password.'
    end

    it 'successfully logs in' do
      User.create(
        username: 'Rex',
        password: 'correctpassword'
      )

      visit user_session_path
      fill_in 'Username', with: 'Rex'
      fill_in 'Password', with: 'correctpassword'
      click_button 'Log in'
      expect(page).to have_current_path(root_path)
    end
  end
end
