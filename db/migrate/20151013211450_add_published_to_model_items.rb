class AddPublishedToModelItems < ActiveRecord::Migration
  def change
    add_column :model_items, :published, :boolean, :default => true
  end
end
