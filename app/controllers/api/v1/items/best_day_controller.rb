class Api::V1::Items::BestDayController < ApplicationController
  def show
    # best_day = Item.best_day(params[:item_id])
    # render json: { "best_day": best_day }
    render json: Item.best_day(params[:item_id]),
                 serializer: ItemsBestDaySerializer
  end
end