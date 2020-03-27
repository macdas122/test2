class Addsome < ActiveRecord::Migration[5.2]
  def change
	    add_column :pzns, :aufnahme, :date
            add_column :pzns, :wikrstoff_menge, :string
  end
end
