class Addmany < ActiveRecord::Migration[5.2]
  def change
    remove_column :studies, :studien_info , :string
    remove_column :studies, :studien_length_number , :string
    remove_column :studies, :studien_length_typ , :string
    add_column :study_arms, :behandlungsnummer , :string
    add_column :study_arms, :behandlungstyp , :string
    remove_column :gbasubgroups, :jahrestherapiekosten_netto_min ,:decimal
    remove_column :gbasubgroups, :jahrestherapiekosten_netto_max ,:decimal
    remove_column :gbasubgroups, :netto_preisverhandlung_max ,:decimal
    remove_column :gbasubgroups, :netto_preisverhandlung_min ,:decimal
    remove_column :gbasubgroups, :brutto_preisverhandlung_min ,:decimal
    remove_column :gbasubgroups, :brutto_preisverhandlung_max ,:decimal
    add_column :mains , :datum_preisverhandlung , :date
  end
end
