class Addthing < ActiveRecord::Migration[5.2]
  def change
    add_column :subgroups, :anmerkung,:string
    add_column :iqsubgroups, :anmerkung,:string
    add_timestamps :pzns, default: Time.now
  end
end
