class Api::V1::Merchants::RevenueController < ApplicationController
  def index
    revenue_total = Merchant.total_revenue_by_date(params[:date])
    render json: { "total_revenue": revenue_total }
  end

  def show
    render json: { "revenue": Merchant.total_revenue(params[:merchant_id], total_revenue_params) }
  end

  private

  def total_revenue_params
    if params['date']
      { 
        invoices: { 
          updated_at: params['date'].to_date.beginning_of_day..params['date'].to_date.end_of_day 
        }
      }
    end
  end
end