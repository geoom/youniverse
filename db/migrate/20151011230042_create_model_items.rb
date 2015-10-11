class CreateModelItems < ActiveRecord::Migration
  def change
    create_table :model_items do |t|
      t.string :sex
      t.decimal :price, precision: 4, scale: 2

      t.timestamps
    end
  end
end
