class Newonet < ActiveRecord::Migration[5.2]
  def change
    create_table :preis_anmerkungs do |t|
      t.integer :verfahrensnummer
      t.string :anmerkung

      t.timestamps null: false
    end

  end
end
