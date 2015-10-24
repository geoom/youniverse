class AddIsDeletedToOrderItem < ActiveRecord::Migration
  def change
    add_column :order_items, :is_deleted, :boolean, default: false
  end
end
