class AddPublishedToModels < ActiveRecord::Migration
  def change
    add_column :models, :published, :boolean, :default => true
  end
end
