class ChangeSubtotalForOrders < ActiveRecord::Migration
  def change
	  change_column :orders, :subtotal, :decimal, precision:6, scale: 2, default: 0
	  change_column :orders, :total, :decimal, precision:8, scale: 2, default: 0
  end
end
