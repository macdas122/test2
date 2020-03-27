class CreateGbasubgroups < ActiveRecord::Migration[5.2]
  def change
    create_table :gbasubgroups do |t|
      t.integer :verfahrensnummer                       , null: false
      t.string :subgroup_name                           , null: false
      t.boolean :itc                                    , null: false
      t.boolean :nma                                    , null: false
      t.boolean :maic                                   , null: false
      t.integer :itc_eins                               , null: true
      t.integer :itc_zwei                               , null: true
      t.integer :itc_drei                               , null: true
      t.integer :itc_vier                               , null: true
      t.integer :itc_fuenf                              , null: true
      t.integer :population_min                         , null: false
      t.integer :population_max                         , null: true
      t.string :wahrscheinlichkeit                      , null: false
      t.string :benefit                                 , null: false
      t.string :studie_eins                             , null: true
      t.string :studie_zwei                             , null: true
      t.string :studie_drei                             , null: true
      t.string :studie_vier                             , null: true
      t.string :studie_fuenf                            , null: true
      t.string :studie_sechs                            , null: true
      t.decimal :jahrestherapiekosten_gba_min           , null: true
      t.decimal :jahrestherapiekosten_gba_max           , null: true
      t.decimal :jahrestherapiekosten_netto_min         , null: true
      t.decimal :jahrestherapiekosten_netto_max         , null: true
      t.decimal :zvt_eins_min                           , null: true
      t.decimal :zvt_eins_max                           , null: true
      t.decimal :zvt_zwei_min                           , null: true
      t.decimal :zvt_zwei_max                           , null: true
      t.decimal :zvt_drei_min                           , null: true
      t.decimal :zvt_drei_max                           , null: true
      t.decimal :zvt_vier_min                           , null: true
      t.decimal :zvt_vier_max                           , null: true
      t.decimal :zvt_fuenf_min                          , null: true
      t.decimal :zvt_fuenf_max                          , null: true
      t.decimal :zvt_sechs_min                          , null: true
      t.decimal :zvt_sechs_max                          , null: true
      t.decimal :zvt_sieben_min                         , null: true
      t.decimal :zvt_sieben_max                         , null: true
      t.decimal :zvt_acht_min                           , null: true
      t.decimal :zvt_acht_max                           , null: true
      t.decimal :zvt_neun_min                           , null: true
      t.decimal :zvt_neun_max                           , null: true
      t.decimal :zvt_zehn_min                           , null: true
      t.decimal :zvt_zehn_max                           , null: true
      t.string :zvt_name_eins				, null: true
      t.string :zvt_name_zwei                           , null: true
      t.string :zvt_name_drei                           , null: true
      t.string :zvt_name_vier                           , null: true
      t.string :zvt_name_fuenf                          , null: true
      t.string :zvt_name_sechs                          , null: true
      t.string :zvt_name_sieben                         , null: true
      t.string :zvt_name_acht                           , null: true
      t.string :zvt_name_neun                           , null: true
      t.string :zvt_name_zehn                           , null: true


     end
  end
end
