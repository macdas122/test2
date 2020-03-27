class Some < ActiveRecord::Migration[5.2]
  def change
	add_column :pzns , :apothekenabschlag , :decimal
	add_column :study_arms , :zutreffend , :boolean
  end
end
