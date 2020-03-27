class CreateJtkgbas < ActiveRecord::Migration[5.2]
  def change
    create_table :jtkgbas do |t|

      t.string :subgruppe , null: false
      t.string :dosierung , null: false
      t.string :pzn , null: false
      t.string :zuweisung , null: false
      t.decimal :hr_ges_netto , null:true
      t.decimal :apu_netto , null:true
      t.decimal :kosten_gkv , null:true
      t.decimal :jtk_gkv , null:true
      t.decimal :jtk_apu_netto , null:true
      t.string :eingetragen , null:true 

      t.timestamps
    end
    add_index :jtkgbas, :id, unique: true
  end
end
