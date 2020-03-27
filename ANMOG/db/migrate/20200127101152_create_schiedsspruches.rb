class CreateSchiedsspruches < ActiveRecord::Migration[5.2]
  def change
    create_table :schiedsspruches do |t|

      t.timestamps
    end
  end
end
