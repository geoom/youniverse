class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :quantity
      t.decimal :total_price, precision: 6, scale: 2
      t.string :size, limit: 3
      t.references :model_item, index: true
      t.references :order, index: true

      t.timestamps
    end
  end
end
