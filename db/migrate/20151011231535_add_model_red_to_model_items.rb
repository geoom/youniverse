class AddModelRedToModelItems < ActiveRecord::Migration
  def change
    add_reference :model_items, :model, index: true
  end
end
