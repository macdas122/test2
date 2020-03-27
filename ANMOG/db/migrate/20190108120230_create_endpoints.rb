class CreateEndpoints < ActiveRecord::Migration[5.2]
  def change
    create_table :endpoints do |t|
      t.string :bezeichnung   	, null: false
      t.string :instrument   	, null: false
      t.string :study	      	, null: false
      t.string :category      	, null: false
      t.string :classification 	, null: false

    end
    add_index :endpoints, :id, unique:true
  end
end
