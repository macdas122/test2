class AddBrutto < ActiveRecord::Migration[5.2]
  def change
            add_column :gbasubgroups, :brutto_verhandlung_max ,:string
            add_column :gbasubgroups, :brutto_verhandlung_min ,:string
  end
end
