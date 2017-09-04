class CreateReceptionDesks < ActiveRecord::Migration[5.1]
  def change
    create_table :reception_desks do |t|
      t.string :name
      t.string :location

      t.timestamps
    end
  end
end
