class RemoveNameToLostItems < ActiveRecord::Migration[5.1]
  def change
    remove_column :lost_items, :name, :string
  end
end
