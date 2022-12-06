module AuthHelper
  def login_user
    @user = User.create(username: 'Rex', password: 'password')
    visit new_user_session_path
    fill_in 'Username', with: 'Rex'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
  end

  def login_admin
    @user = User.create(username: 'Admin', password: 'password', role: 'admin')
    visit user_session_path
    fill_in 'Username', with: 'Admin'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
  end
end
