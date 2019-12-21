class CreateWeapons < ActiveRecord::Migration[5.2]
  def change
    create_table :weapons do |t|
      t.string :name, null: false
      t.string :description, null: false, default: ''
      t.integer :power_base, null: false, default: 0
      t.integer :power_step, null: false, default: 0
      t.integer :level, null: false, default: 1

      t.timestamps
    end
    add_index :weapons, :name, name: "index_on_weapon_name", unique: true
  end
end
