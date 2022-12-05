require 'rails_helper'

RSpec.describe 'Sign up', type: :feature do
  describe 'index page for users' do
    it 'has the "Sign up" button' do
      visit new_user_registration_path
      expect(page).to have_content 'Sign up'
    end

    it 'has password, password_confirmation and username inputs' do
      visit new_user_registration_path
      expect(page).to have_field 'Username'
      expect(page).to have_field 'Password'
      expect(page).to have_field 'Password confirmation'
    end

    it 'displays an error when submitting with EMPTY fields' do
      visit new_user_registration_path
      click_button 'Sign up'
      expect(page).to have_content '4 error'
      expect(page).to have_content "Username can't be blank"
      expect(page).to have_content 'Username is too short (minimum is 3 characters)'
      expect(page).to have_content "Password can't be blank"
      expect(page).to have_content 'Password is too short (minimum is 6 characters)'
    end

    it 'displays an error when submitting an INVALID Short Username' do
      visit new_user_registration_path
      fill_in 'Username', with: 'Rx'
      click_button 'Sign up'
      expect(page).to have_content 'Username is too short (minimum is 3 characters)'
    end

    it 'displays an error when submitting an INVALID Short Password' do
      visit new_user_registration_path
      fill_in 'Password', with: 'pass'
      click_button 'Sign up'
      expect(page).to have_content 'Password is too short (minimum is 6 characters)'
    end

    it 'displays an error when submitting an MISMATCH Password confirmation' do
      visit new_user_registration_path
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'pass'
      click_button 'Sign up'
      expect(page).to have_content "Password confirmation doesn't match Password"
    end

    it 'displays an error when Username is already taken' do
      User.create(
        username: 'Rex',
        password: 'password'
      )
      visit new_user_registration_path
      fill_in 'Username', with: 'Rex'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      click_button 'Sign up'
      expect(page).to have_content 'Username has already been taken'
    end

    it 'successfully Sign up' do
      visit new_user_registration_path
      fill_in 'Username', with: 'Rex'
      fill_in 'Password', with: 'correctpassword'
      fill_in 'Password confirmation', with: 'correctpassword'
      click_button 'Sign up'
      expect(page).to have_current_path(root_path)
    end
  end
end
