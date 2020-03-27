class AddPznNew < ActiveRecord::Migration[5.2]
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
      t.decimal :ppu
      t.decimal :nbr
      t.decimal :erstattungsbetrag
      t.decimal :apu_hap
      t.decimal :taxe_ek
      t.decimal :hr_ges
      t.decimal :vk_ges
      t.string :v
      t.string :drf_bezeichnung
      t.date :aufnahme
      t.string :wirkstoff_menge
      t.decimal :apothekenabschlag
    end
  end
end
