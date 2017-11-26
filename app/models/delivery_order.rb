class DeliveryOrder < ApplicationRecord
  validates_presence_of :order_id, :serving_datetime
  has_many :order_items
  has_many :meals, through: :order_items

  def as_json(options={})
    super(except: [:id, :serving_datetime],
          methods: [:delivery_date, :delivery_time])
  end


  def delivery_date
    serving_datetime.to_date
  end


  def delivery_time
    serving_datetime.strftime("%H:%M") + '-' + (serving_datetime + 30*60).strftime("%H:%M") + 'AM'
  end


  def order_items_details
    order_items = self.order_items.map do |item|
       {
        name: item.meal.name,
        quantity: item.quantity,
        total_price: item.quantity * item.unit_price
      }
    end
    return {
      order_id: order_id,
      delivery_date: delivery_date,
      delivery_time: delivery_time,
      order_items: order_items
    }
  end

end
