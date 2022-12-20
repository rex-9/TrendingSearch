require 'rails_helper'
require 'helpers/auth_helper'

RSpec.describe 'Trends', type: :system, js: true do
  include AuthHelper

  describe 'Home page' do
    before(:example) do
      login_user
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

  describe 'Show page' do
    before(:example) do
      login_user
      click_on 'What is Ruby on Rails?'
    end

    it 'renders Major content of the Show Page' do
      expect(page).to have_content('Hehe!')
    end
  end

  describe 'Search Features' do
    before(:example) do
      login_user
    end

    it 'Search Recent Searches by the Current User case-insensitively' do
      fill_in 'Surf', with: 'rails'
      expect(page).to have_content('What is Ruby on Rails?')
    end

    it 'Search Global Trends across the Network case-insensitively' do
      fill_in 'Surf', with: 'emil'
      expect(page).to have_content('How handsome is Emil?')
    end
  end
end
