class Raba < ActiveRecord::Migration[5.2]
  def change
            add_column :jtkgbs, :verfahren, :integer
            add_column :jtkpvs, :verfahren, :integer
            add_column :jtkakts , :rabatt_ges , :decimal
            add_column :jtkpvhs , :rabatt_ges , :decimal
            add_column :jtkpvs , :datum , :date
  end
end
