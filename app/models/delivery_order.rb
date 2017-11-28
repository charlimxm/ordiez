class DeliveryOrder < ApplicationRecord
  validates_presence_of :order_id, :serving_datetime
  has_many :order_items
  has_many :meals, through: :order_items
  has_one :feedback, as: :ratable

  def as_json(options={})
    super(only: [:id, :order_id],
          methods: [:delivery_date, :delivery_time, :feedback_submitted, :order_items_details])
  end


  def delivery_date
    serving_datetime.to_date
  end

  def delivery_time
    serving_datetime.strftime("%H:%M") + '-' + (serving_datetime + 30*60).strftime("%H:%M") + 'AM'
  end

  def feedback_submitted
    feedback ? true : false
  end

  def order_items_details
    order_items = self.order_items.map do |item|
       {
        order_items_id: item.id,
        name: item.meal.name
      }
    end
  end

  def order_items_details2
    order_items = self.order_items.map do |item|
       {
        meal_id: item.meal.id,
        name: item.meal.name,
        quantity: item.quantity,
        total_price: item.quantity * item.unit_price
      }
    end
    return {
      order_id: order_id,
      delivery_date: delivery_date,
      delivery_time: delivery_time,
      feedback_submitted: feedback_submitted,
      order_items: order_items
    }
  end

end
