class CreatePzns < ActiveRecord::Migration[5.2]
  def change
    create_table :pzns do |t|
      t.integer :PZN
      t.string :Wirkstoffe
      t.string :Artikelname
      t.string :Anbietername
      t.string :Volumen
      t.string :Einheit
      t.integer :Menge
      t.string :Einheiten
      

    end
  end
end
