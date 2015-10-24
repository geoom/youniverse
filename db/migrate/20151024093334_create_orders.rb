class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.decimal :subtotal, precision: 6, scale: 2
      t.decimal :total, precision: 8, scale: 2
      t.references :user, index: true

      t.timestamps
    end
  end
end
