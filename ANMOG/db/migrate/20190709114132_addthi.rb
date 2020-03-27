class Addthi < ActiveRecord::Migration[5.2]
  def change
    remove_column :mains , :datum_preisverhandlung , :date
    add_column :gbasubgroups , :datum_preisverhandlung , :date
    add_column :subgroups , :itc_sechs , :string
    add_column :subgroups , :itc_sieben , :string
    add_column :subgroups , :itc_acht , :string
    add_column :subgroups , :itc_neun , :string
    add_column :subgroups , :itc_zehn , :string
    add_column :subgroups , :itc_elf , :string
    add_column :subgroups , :itc_zwoelf , :string
    add_column :iqsubgroups , :itc_sechs , :string
    add_column :iqsubgroups , :itc_sieben , :string
    add_column :iqsubgroups , :itc_acht , :string
    add_column :iqsubgroups , :itc_neun , :string
    add_column :iqsubgroups , :itc_zehn , :string
    add_column :iqsubgroups , :itc_elf , :string
    add_column :iqsubgroups , :itc_zwoelf , :string
    add_column :gbasubgroups , :itc_sechs , :string
    add_column :gbasubgroups , :itc_sieben , :string
    add_column :gbasubgroups , :itc_acht , :string
    add_column :gbasubgroups , :itc_neun , :string
    add_column :gbasubgroups , :itc_zehn , :string
    add_column :gbasubgroups , :itc_elf , :string
    add_column :gbasubgroups , :itc_zwoelf , :string
  end
end
