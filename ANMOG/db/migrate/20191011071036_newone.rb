class Newone < ActiveRecord::Migration[5.2]
  def change
    create_table :preis_anmerkung do |t|
      t.integer :verfahrensnummer
      t.string :anmerkung

      t.timestamps null: false
    end
    add_index :preis_anmerkung, :id, unique: true
    remove_column :jtkgbas, :anmerkung, :string
    remove_column :jtkgbs, :anmerkung, :string



  end
end
