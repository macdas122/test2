class AddVerhandlung < ActiveRecord::Migration[5.2]
  def change
	    add_column :gbasubgroups, :nach_verhandlung_max ,:string
	    add_column :gbasubgroups, :nach_verhandlung_min ,:string
  end
end
