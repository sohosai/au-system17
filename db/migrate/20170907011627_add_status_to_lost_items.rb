class AddStatusToLostItems < ActiveRecord::Migration[5.1]
  def change
    add_column :lost_items, :status, :boolean, null: false, default: false
  end
end
