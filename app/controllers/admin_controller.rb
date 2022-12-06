class AdminController < ApplicationController
  def dashboard
    @users = User.all.order(:id)
    @trends = Trend.all.order(:popularity).reverse
    return unless current_user.role != 'admin'

    redirect_to root_path
  end

  def user_trends
    @user = User.find(params[:id])
    @trends = @user.trends.order(:popularity).reverse
    return unless current_user.role != 'admin'

    redirect_to root_path
  end

  def trend_users
    @trend = Trend.find(params[:id])
    @users = @trend.users.order(:id)
    return unless current_user.role != 'admin'

    redirect_to root_path
  end
end
