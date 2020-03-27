class Addsome1 < ActiveRecord::Migration[5.2]
  def change
	add_column :pricedata , :verfahrensnummer , :numeric

  end
end
