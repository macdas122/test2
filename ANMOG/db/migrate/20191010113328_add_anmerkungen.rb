class AddAnmerkungen < ActiveRecord::Migration[5.2]
  def change
      add_column :jtkgbs , :anmerkung , :string 
   end
end
