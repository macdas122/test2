class Rmv < ActiveRecord::Migration[5.2]
  def change
    remove_column :mains, :market_availability, :string
  end
end
