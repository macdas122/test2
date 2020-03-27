class CreatePreises < ActiveRecord::Migration[5.2]
  def change
    create_table :preises do |t|
	t.string :pzn			,null: false
	t.string :wirkstoff		,null: false
	t.string :anbietername		,null: false
        t.string :volumen                   ,null: false
        t.string :einheit             ,null: false
        t.string :menge           ,null: false
        t.string :verpackungseinheit                   ,null: false
        t.string :ppu             ,null: false
        t.string :nbr           ,null: false
        t.string :erstattzngsbetrag                   ,null: false
        t.string :apu_hap             ,null: false
        t.string :tax_ek           ,null: false
        t.string :hr_ges                   ,null: false
        t.string :ges_vk             ,null: false
        t.string :v           ,null: false
        t.string :drf_bez           ,null: false









      t.timestamps
    end
  end
end
