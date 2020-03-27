class Changename < ActiveRecord::Migration[5.2]
  def change
	rename_table :pricedata, :schiedsspruch
  end
end
