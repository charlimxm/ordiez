class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.references :delivery_order, foreign_key: true, null: false
      t.references :meal, foreign_key: true, null: false
      t.integer :quantity, null: false
      t.integer :unit_price, null: false
    end
  end
end
