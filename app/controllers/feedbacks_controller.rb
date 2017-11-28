class FeedbacksController < ApplicationController
  def show
    @order = DeliveryOrder.find_by(order_id: params[:order_id])
    @items = OrderItem.where(delivery_order_id: @order.id)

    @allID = @items.ids.unshift(@order.id)

    @items_fb = Feedback.where(ratable_id: @allID)

    render json: @items_fb
  end
end
