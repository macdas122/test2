class AddDivToProcedure < ActiveRecord::Migration[5.2]
  def change
    add_column :mains, :over_one_million, :boolean
    add_column :mains, :befristung, :date
  end
end
