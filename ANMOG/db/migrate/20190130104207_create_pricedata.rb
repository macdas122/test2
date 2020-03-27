class CreatePricedata < ActiveRecord::Migration[5.2]
  def change
    create_table :pricedata do |t|
      t.string :date
      t.string :attachment

      t.timestamps
    end
  end
end
