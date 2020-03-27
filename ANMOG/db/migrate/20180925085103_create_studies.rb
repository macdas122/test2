class CreateStudies < ActiveRecord::Migration[5.2]
  def change
    create_table :studies do |t|
          t.string  :studien_name           , null: false
          t.string  :studien_typ	    , null: false
          t.boolean :safety		    , null: false
	  t.boolean :label	   	    , null: false
          t.boolean :extension              , null: false
          t.boolean :controlled             , null: false
          t.boolean :registry               , null: false
          t.boolean :randomized             , null: false
          t.string  :randomization           , null: false
          t.integer :population             , null: false
          t.string  :studien_length_number   , null: false
          t.string  :studien_length_typ      , null: true
	  t.string  :evidenz                 , null: false
          t.string  :annotation              , null: true
	  t.boolean :clinicaltrials         , null: true
	  t.string  :clinical		    , null: true
          t.boolean :single_arm	            , null: false
          t.string  :IWT			    , null: true
          t.boolean :multizenter            , null: false
          t.boolean :double_bline           , null: false
          t.boolean :multinational          , null: false
          t.boolean :efficacy               , null: false
          t.string  :bezeichnung             , null: false
          t.string  :sponsor                 , null: false
          t.string  :phase             	    , null: false
          t.boolean :dosefinding       	    , null: false
          t.boolean :ongoing           	    , null: false
	  t.boolean :nhs		    , null: false
	  t.string  :population 	            , null: true 		
	
        end
        add_index :studies, :id, unique: true
    end
  end
