class Fixit < ActiveRecord::Migration[5.2]
  def change
	rename_column :pzns, :PZN , :pzn
  end
end
