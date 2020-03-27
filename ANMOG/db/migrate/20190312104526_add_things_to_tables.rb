class AddThingsToTables < ActiveRecord::Migration[5.2]
  def change
    add_column :mains, :label, :string
    add_column :mains, :erst_einreichung, :boolean
    add_column :subgroups, :zvt_status ,:string
    add_column :gbasubgroups, :zvt_status ,:string
    add_column :iqsubgroups, :zvt_status ,:string
    add_column :endpoints, :herangezogen,:boolean
  end
end
