class AdminController < ApplicationController
  def dashboard
    @users = User.all.order(:id)
    @trends = Trend.all.order(:id)
    if current_user.role != 'admin'
      redirect_to root_path
    end
  end

  def user_trends
    @user = User.find(params[:id])
    @trends = @user.trends.order(:id)
    if current_user.role != 'admin'
      redirect_to root_path
    end
  end

  def trend_users
    trend = Trend.find(params[:id])
    @users = trend.users.order(:id)
    if current_user.role != 'admin'
      redirect_to root_path
    end
  end
end
