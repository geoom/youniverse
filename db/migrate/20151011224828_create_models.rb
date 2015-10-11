class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
      t.string :name
      t.text :description
      t.string :type
      t.references :product, index: true

      t.timestamps
    end
  end
end
