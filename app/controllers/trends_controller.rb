class TrendsController < ApplicationController
  def index
    @trends = if params[:query].present?
                Trend.where('lower(keyword) LIKE ?', "%#{params[:query].downcase}%")
              else
                Trend.all
              end

    if turbo_frame_request?
      render partial: 'trends', locals: { trends: @trends }
    else
      render :index
    end
  end

  def show
    @trend = Trend.find(params[:id])
  end

  def create; end

  def destroy; end
end
