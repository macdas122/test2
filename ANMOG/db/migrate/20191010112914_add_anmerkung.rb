class AddAnmerkung < ActiveRecord::Migration[5.2]
  def change
	add_column :jtkgbas, :anmerkung, :string
  end
end
