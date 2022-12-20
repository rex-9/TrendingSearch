class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def create_join(user_id, trend_id)
    existing = UserTrend.find_by(user_id:, trend_id:)
    UserTrend.create(user_id:, trend_id:) unless existing
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :password, :password_confirmation) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :password, :current_password) }
  end
end
