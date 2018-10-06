class Api::V1::Items::BestDayController < ApplicationController
  def show
    render json: Item.best_day(params[:item_id]),
                 serializer: ItemsBestDaySerializer
  end
end