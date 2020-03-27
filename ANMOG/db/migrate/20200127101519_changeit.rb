class Changeit < ActiveRecord::Migration[5.2]
  def change
    drop_table :schiedsspruches
    rename_table :schiedsspruch , :schiedsspruches
  end
end
