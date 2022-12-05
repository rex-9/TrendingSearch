class TrendsController < ApplicationController
  before_action :authenticate_user!

  def index
    @trends = if params[:query].present?
                Trend.where('lower(keyword) LIKE ?', "%#{params[:query].downcase}%").order(:popularity).reverse
              else
                current_user.trends.order(:popularity).reverse
              end

    unless (params[:query] =~ /^[A-Z][a-zA-Z0-9\s]*[.?!]$/).nil?
      existing = Trend.where('lower(keyword) LIKE ?', "%#{params[:query].downcase}%").first
      if existing
        existing.increment!(:popularity)
      else
        new_trend = Trend.create(keyword: params[:query])
        UserTrend.create(user_id: current_user.id, trend_id: new_trend.id)
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
    @trend.update_attribute(:popularity, @trend.popularity + 1)
  end
end
