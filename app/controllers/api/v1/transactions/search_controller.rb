class Api::V1::Transactions::SearchController < ApplicationController
  def show
    render json: Transaction.find_by(search_params)
  end

  def index
    render json: Transaction.where(search_params)
  end

  private

  def search_params
    params.permit(:id, :credit_card_number, :invoice_id, :result, :created_at, :updated_at)
  end
end