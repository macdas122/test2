class CreateStudyArms < ActiveRecord::Migration[5.2]
  def change
    create_table :study_arms do |t|
      t.string :stud_name               , null: true
      t.string :controlled_intervention , null: false
      t.string :medication              , null: false
      t.string :dosing                  , null: false
      t.string :verabreichnung		, null: true
      t.integer :number_patient         , null: false
      t.string :bezeichnung		, null: true

    end
  end
end
