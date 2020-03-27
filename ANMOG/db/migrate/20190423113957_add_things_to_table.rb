class AddThingsToTable < ActiveRecord::Migration[5.2]
  def change
    add_column :endpoints, :anmerkung,:string
    add_column :studies, :studien_info,:string
    add_column :gbasubgroups, :netto_preisverhandlung_min,:string
    add_column :gbasubgroups, :netto_preisverhandlung_max,:string
    add_column :gbasubgroups, :brutto_preisverhandlung_min,:string
    add_column :gbasubgroups, :brutto_preisverhandlung_max,:string

  end
end
