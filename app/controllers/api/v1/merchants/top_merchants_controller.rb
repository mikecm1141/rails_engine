class Api::V1::Merchants::TopMerchantsController < ApplicationController
  def index
    render json: Merchant.top_merchants_by_revenue(params[:quantity])
  end
end