class CreateFoundItems < ActiveRecord::Migration[5.1]
  def change
    create_table :found_items do |t|
      t.integer :resolver_id
      t.datetime :resolved_at
      t.references :reception_desk, index: true, foreign_key: true
      t.integer :receptionist_id
      t.string :name
      t.integer :kind
      t.string :location_found
      t.string :item_characteristic
      t.string :finder_name
      t.string :finder_contact
      t.text :note

      t.timestamps
    end
  end
end
