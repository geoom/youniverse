class RenameTypeFromModels < ActiveRecord::Migration
  def change
	  rename_column :models, :type, :sort
  end
end
