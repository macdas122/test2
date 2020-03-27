class Adduser < ActiveRecord::Migration[5.2]
  def change
    add_column :gbasubgroups, :anmerkung,:string
    add_column :study_arms, :anmerkung,:string
    add_column :gbasubgroups, :updated_by ,:string
    add_column :subgroups, :updated_by ,:string
    add_column :iqsubgroups, :updated_by ,:string
    add_column :mains, :updated_by ,:string
    add_column :endpoints, :updated_by ,:string
    add_column :studies, :updated_by ,:string
    add_column :study_arms, :updated_by ,:string
  end
end
