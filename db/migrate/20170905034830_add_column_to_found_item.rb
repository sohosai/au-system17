class AddColumnToFoundItem < ActiveRecord::Migration[5.1]
  def change
    add_column :found_items, :status, :boolean
  end
end
