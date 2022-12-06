require 'rails_helper'
require 'helpers/auth_helper'

RSpec.describe 'Admin', type: :system, js: true do
  include AuthHelper

  describe 'Everything Users can do' do
    describe 'Home Page' do
      before(:example) do
        login_admin
      end

      it 'renders Name of the Webpage' do
        expect(page).to have_content('Web Arena')
      end

      it 'renders Name of the logged in User' do
        expect(page).to have_content(@user.username)
      end

      it 'renders Icon of the Magnifying glass' do
        expect(page).to have_css('#lens')
      end

      it 'renders Name of the Trend searched by the User' do
        expect(page).to have_content('What is Ruby on Rails?')
      end

      it 'renders Popularity Point of the Trend' do
        expect(page).to have_content('1')
      end

      it 'redirects to Trend path when a keyword is clicked' do
        click_on 'What is Ruby on Rails?'
        expect(page).to have_current_path(trend_path(1))
      end
    end

    describe 'show page' do
      before(:example) do
        login_admin
        click_on 'What is Ruby on Rails?'
      end

      it 'renders Major content of the Show Page' do
        expect(page).to have_content('Hehe!')
      end
    end

    describe 'Admin Dashboard' do
      before(:example) do
        login_admin
        click_on 'Dashboard'
      end

      it 'renders The Sidebar of the Admin Panel' do
        expect(page).to have_css('#panel')
        expect(page).to have_css('#users-icon')
        expect(page).to have_css('#trend-icon')
      end

      it 'renders The Users Table when clicked on Users menu in the Sidebar' do
        click_button 'Users'
        expect(page).to have_content('ID')
        expect(page).to have_content('Username')
        expect(page).to have_content('Total Trends')
      end

      it 'redirect to the UserTrends page when clicked on the Username' do
        click_link 'Admin'
        expect(page).to have_current_path('/users/1/trends')
      end

      it 'renders The Header of TrendUsers when clicked on the Username' do
        click_link 'Admin'
        expect(page).to have_content('Trends searched by')
      end

      it 'renders The Header of TrendUsers when clicked on the Username' do
        click_link 'Admin'
        expect(page).to have_content('Trends searched by')
        expect(page).to have_content('ID')
        expect(page).to have_content('Keyword')
        expect(page).to have_content('Popularity')
        expect(page).to have_content('Total Users')
      end

      it 'render the contents of UserTrends page' do
        visit user_trends_path(1)
        expect(page).to have_content('Trends searched by')
        expect(page).to have_content('ID')
        expect(page).to have_content('Keyword')
        expect(page).to have_content('Popularity')
        expect(page).to have_content('Total Users')
      end

      it 'renders The Trends Table when clicked on Trends menu in the Sidebar' do
        click_button 'Trends'
        expect(page).to have_content('ID')
        expect(page).to have_content('Keyword')
        expect(page).to have_content('Popularity')
        expect(page).to have_content('Total Users')
      end

      it 'redirect to the TrendUsers page when clicked on the Keyword' do
        click_button 'Trends'
        click_on 'What is Ruby on Rails?'
        expect(page).to have_current_path(trend_users_path(1))
      end

      it 'renders The Header of TrendUsers when clicked on Keyword' do
        click_button 'Trends'
        click_on 'What is Ruby on Rails?'
        expect(page).to have_content('Users who are interested in the Topic')
      end

      it 'renders The Header of TrendUsers when clicked on Keyword' do
        click_button 'Trends'
        click_on 'What is Ruby on Rails?'
        expect(page).to have_content('ID')
        expect(page).to have_content('Username')
        expect(page).to have_content('Total Trends')
      end

      it 'contents of the UserTrends page' do
        visit trend_users_path(1)
        expect(page).to have_content('Users who are interested in the Topic')
        expect(page).to have_content('ID')
        expect(page).to have_content('Username')
        expect(page).to have_content('Total Trends')
      end
    end
  end
end
