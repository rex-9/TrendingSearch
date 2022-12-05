require 'rails_helper'

RSpec.describe 'Trends', type: :system, js: true do
  describe 'index page' do
    before(:example) do
      # visit new_user_registration_path
      # fill_in "Username",              :with => "Hello"
      # fill_in "Password",              :with => "password"
      # fill_in "Password confirmation", :with => "password"

      # click_button "Sign up"

      @user = User.create(username: 'Rex', password: 'password')
      sign_in @user

      @trend = Trend.create(keyword: 'What is Ruby on Rails?')
      visit root_path
    end

    it 'renders Name of the Webpage' do
      expect(page).to have_content('Web Arena')
    end

    it 'renders Name of the logged in User' do
      expect(page).to have_content(@user.username)
    end

    it 'renders Icon of the Magnifying glass' do
      expect(page).to have_selector('img[alt="lens"]')
    end

    it 'renders Name of the Trend searched by the User' do
      expect(page).to have_content(@trend.keyword)
    end

    it 'renders Popularity Point of the Trend' do
      expect(page).to have_content('1')
    end

    it 'redirects to Purchases path when a category is clicked' do
      click_button @trend.keyword
      expect(page).to have_current_path(trend_path(@trend.id))
    end
  end
end
