class CreateJtkaks < ActiveRecord::Migration[5.2]
  def change
    create_table :jtkaks do |t|
      t.string :subgruppe , null: false
      t.string :dosierung_eins , null: false
      t.string :dosierung_zwei , null: false
      t.string :dosierung_drei , null: false
      t.string :dosierung_vier , null: false
      t.string :dosierung_fuenf , null: false
      t.string :dosierung_sechs  , null: false
      t.string :pzn_eins , null: false
      t.string :pzn_zwei , null: true
      t.string :pzn_drei , null: true
      t.string :pzn_vier , null: true
      t.string :pzn_fuenf , null: true
      t.string :pzn_sechs , null: true
      t.string :eingetragen , null: false
 
      t.timestamps null: false
    end
    add_index :jtkaks, :id, unique: true
  end
end
