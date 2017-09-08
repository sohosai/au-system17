class RemoveNameToFoundItems < ActiveRecord::Migration[5.1]
  def change
    remove_column :found_items, :name, :string
  end
end
