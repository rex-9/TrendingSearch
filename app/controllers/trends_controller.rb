class TrendsController < ApplicationController
  def index
    @trends = if params[:query].present?
                Trend.where('lower(keyword) LIKE ?', "%#{params[:query].downcase}%").order(:searches).reverse
              else
                Trend.all.order(:searches).reverse
              end

    if !!( params[:query] =~ /^[A-Z][a-zA-Z0-9\s]*[.?!]$/ )
      existing = Trend.where('lower(keyword) LIKE ?', "%#{params[:query].downcase}%").first
      if existing
        existing.increment!(:searches)
      else
        Trend.create(keyword: params[:query])
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
    @trend.update_attribute(:searches, @trend.searches + 1)
  end
end
