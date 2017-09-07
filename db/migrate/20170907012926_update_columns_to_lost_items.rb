class UpdateColumnsToLostItems < ActiveRecord::Migration[5.1]
  def up
    change_column :lost_items, :reception_desk_id, :integer, null: false
    change_column :lost_items, :receptionist_id, :integer, null: false
    change_column :lost_items, :name, :string, null: false
    change_column :lost_items, :kind, :integer, null: false, default: 0
    change_column :lost_items, :location_lost, :string, null: false
    change_column :lost_items, :characteristic, :string, null: false
  end

  def down
    change_column :lost_items, :reception_desk_id, :integer, null: true
    change_column :lost_items, :receptionist_id, :integer, null: true
    change_column :lost_items, :name, :string, null: true
    change_column :lost_items, :kind, :integer, null: true, default: ""
    change_column :lost_items, :location_lost, :string, null: true
    change_column :lost_items, :characteristic, :string, null: true
  end
end
