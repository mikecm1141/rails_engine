class Api::V1::Items::MostItemsController < ApplicationController
  def index
    render json: Item.top_items_by_quantity(params[:quantity])
  end
end