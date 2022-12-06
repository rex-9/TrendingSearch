class AdminController < ApplicationController
  def dashboard
    @users = User.all.order(:id)
    @trends = Trend.all.order(:id)
  end

  def user_trends
    user = User.find(params[:id])
    @trends = user.trends.order(:id)
  end

  def trend_users
    trend = Trend.find(params[:id])
    @users = trend.users.order(:id)
  end
end
