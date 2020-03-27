class AddPzn < ActiveRecord::Migration[5.2]
  def change
	 add_column :pzns, :ppu, :decimal
         add_column :pzns, :nbr, :decimal
         add_column :pzns, :erstattungsbetrag , :decimal
         add_column :pzns, :apu_hap, :decimal
         add_column :pzns, :taxe_ek, :decimal
         add_column :pzns, :hr_ges, :decimal
         add_column :pzns, :vk_ges, :decimal
         add_column :pzns, :v, :string
         add_column :pzns, :drf_bezeichnung, :string
  end
end
