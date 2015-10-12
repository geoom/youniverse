class AddAttachmentImageToModelItems < ActiveRecord::Migration
  def self.up
    change_table :model_items do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :model_items, :image
  end
end
