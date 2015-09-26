class AddAttachmentDesignImageToProducts < ActiveRecord::Migration
  def self.up
    change_table :products do |t|
      t.attachment :design_image
    end
  end

  def self.down
    remove_attachment :products, :design_image
  end
end
