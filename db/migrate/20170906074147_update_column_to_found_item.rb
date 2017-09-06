class UpdateColumnToFoundItem < ActiveRecord::Migration[5.1]
  def up
    change_column :found_items, :reception_desk_id, :integer, null: false
    change_column :found_items, :receptionist_id, :integer, null: false
    change_column :found_items, :name, :string, null: false
    change_column :found_items, :kind, :integer, null: false, default: 0
    change_column :found_items, :location_found, :string, null: false
    change_column :found_items, :characteristic, :string, null: false
  end

  def down
    change_column :found_items, :reception_desk_id, :integer, null: true
    change_column :found_items, :receptionist_id, :integer, null: true
    change_column :found_items, :name, :string, null: true
    change_column :found_items, :kind, :integer, null: true, default: ""
    change_column :found_items, :location_found, :string, null: true
    change_column :found_items, :characteristic, :string, null: true
  end
end
