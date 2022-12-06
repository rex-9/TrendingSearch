class TrendsController < ApplicationController
  before_action :authenticate_user!

  def search
    @trends = if params[:query].present?
                Trend.where('lower(keyword) LIKE ?', "%#{params[:query].downcase}%").order(:popularity).reverse
              else
                current_user.trends.order(:popularity).reverse
              end

    unless (params[:query] =~ /^[A-Z][a-zA-Z0-9\s]*[.?!]$/).nil?
      existing = Trend.where('lower(keyword) LIKE ?', "%#{params[:query].downcase}%").first
      if existing
        existing.increment!(:popularity)
        existing_join = UserTrend.find_by(user_id: current_user.id, trend_id: existing.id)
        UserTrend.create(user_id: current_user.id, trend_id: existing.id) unless existing_join
      else
        new_trend = Trend.create(keyword: params[:query])
        existing_join = UserTrend.find_by(user_id: current_user.id, trend_id: new_trend.id)
        UserTrend.create(user_id: current_user.id, trend_id: new_trend.id) unless existing_join
        flash[:notice] = 'New Trend Recorded.'
      end
    end

    if turbo_frame_request?
      render partial: 'trends', locals: { trends: @trends }
    else
      render :index
    end
  end

  def show
    @trend = Trend.find(params[:id])
    @trend.increment!(:popularity)
    existing = UserTrend.find_by(user_id: current_user.id, trend_id: @trend.id)
    UserTrend.create(user_id: current_user.id, trend_id: @trend.id) unless existing
  end
end
