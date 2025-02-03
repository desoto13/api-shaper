class CreateGuests < ActiveRecord::Migration[7.2]
  def change
    create_table :guests do |t|
      t.bigint :id_number
      t.string :email, null: false
      t.string :first_name
      t.string :last_name
      t.string :phone, array: true, default: []
      t.timestamps
    end

  add_index :guests, :email, unique: true
  add_index :guests, :id_number, unique: true
  end
end
