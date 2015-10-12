class ChangePriceFromModelItems < ActiveRecord::Migration
  def change
	  change_column :model_items, :price, :decimal, precision: 6, scale: 2

  end
end
