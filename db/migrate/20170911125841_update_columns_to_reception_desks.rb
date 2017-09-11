class UpdateColumnsToReceptionDesks < ActiveRecord::Migration[5.1]
  def change
    change_column :reception_desks, :name, :string, null: false
    change_column :reception_desks, :location, :string, null: false
  end
end
