class PznTime < ActiveRecord::Migration[5.2]
  def change
         add_column :pzns, :created_at, :date
         add_column :pzns, :updated_at, :date
  end
end
