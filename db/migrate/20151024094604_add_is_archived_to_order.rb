class AddIsArchivedToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :is_archived, :boolean, default: false
  end
end
