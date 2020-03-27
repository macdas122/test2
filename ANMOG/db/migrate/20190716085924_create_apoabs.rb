class CreateApoabs < ActiveRecord::Migration[5.2]
  def change
    create_table :apoabs do |t|
      t.date :start , null: false
      t.date :end , null: false
      t.decimal :preis , null: false
      t.string :eingetragen , null: false
      t.timestamps
    end
    add_index :apoabs, :id, unique: true
  end
end
