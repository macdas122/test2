class CreateIqsubgroups < ActiveRecord::Migration[5.2]
  def change
    create_table :iqsubgroups do |t|
      t.integer :verfahrensnummer                       , null: false
      t.string :subgroup_name                           , null: false  
      t.string :act                                     , null: true
      t.boolean :itc                                    , null: false
      t.boolean :nma                                    , null: false
      t.boolean :maic                                   , null: false
      t.integer :itc_eins                               , null: true
      t.integer :itc_zwei                               , null: true
      t.integer :itc_drei                               , null: true
      t.integer :itc_vier                               , null: true
      t.integer :itc_fuenf                              , null: true
      t.string :wahrscheinlichkeit                      , null: false
      t.string :benefit                                 , null: false
      t.string :studie_eins                             , null: true
      t.string :studie_zwei                             , null: true
      t.string :studie_drei                             , null: true
      t.string :studie_vier                             , null: true
      t.string :studie_fuenf                            , null: true
      t.string :studie_sechs                            , null: true
      t.string :bewertung				, null:false

    end
    add_index :iqsubgroups, :id, unique: true
  end
end
