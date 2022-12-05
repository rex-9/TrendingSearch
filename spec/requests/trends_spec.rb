# require 'rails_helper'

# RSpec.describe 'Trends', type: :request do
#   before(:example) do
#     @trend = Trend.create(keyword: 'What is Ruby on Rails?')
#     @user = User.create(username: 'Rex', password: 'password')
#     visit user_session_path
#     fill_in 'Username', with: 'Rex'
#     fill_in 'Password', with: 'password'
#     click_button 'Log in'
#   end

#   describe 'test GET #index' do
#     before(:example) { get root_path }

#     it 'return correct response status' do
#       expect(response).to have_http_status(:ok)
#     end

#     it 'should return the rendered template' do
#       expect(response).to render_template('index')
#     end
#   end

#   # describe 'test GET #show' do
#   #   before(:example) do
#   #     post = FactoryBot.create :post, user: @user
#   #     get user_post_path(@user.id, post.id)
#   #   end

#   #   it 'return correct response status' do
#   #     expect(response).to have_http_status(:ok)
#   #   end

#   #   it 'should return the rendered template' do
#   #     expect(response).to render_template('show')
#   #   end
#   # end
# end
