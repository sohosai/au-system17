class ChangeStatusOptionsToFoundItems < ActiveRecord::Migration[5.1]
  def up
    change_column :found_items, :status, :boolean, null: false, default: false
  end

  def down
    change_column :found_items, :status, :boolean, null: true
  end
end
