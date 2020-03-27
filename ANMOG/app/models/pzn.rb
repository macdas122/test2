class Pzn < ApplicationRecord
	require 'csv'
	comma_numbers = ->(s) {(s =~ /^\d+,/) ? (s.gsub(',','.').to_f) : s}
	CSV::Converters[:comma_numbers] = comma_numbers
	def self.import(file)

	require 'csv'
		CSV.foreach(file.path , headers: true,  :col_sep => ";",converters: [:all, :comma_numbers]) do |row|
  			data = {
			id: (Pzn.maximum(:id) +1),
			pzn: row[0],
			Wirkstoffe: row[1],
                        Artikelname: row[2],
                        Anbietername: row[3],
                        Volumen: row[4],
                        Einheit: row[5],
                        Menge: row[6],
                        Einheiten: row[7],
                        ppu: row[8],
                        nbr: row[9],
                        erstattungsbetrag: row[10],
                        apu_hap: row[11],
                        taxe_ek: row[12],
			hr_ges: row[13],
                        vk_ges: row[14],
                        v: row[15],
                        drf_bezeichnung: row[16],
			aufnahme: row[17],
			wirkstoff_menge: row[18],
			apothekenabschlag: 1.77,
                        created_at:	Time.now,
			updated_at:	Time.now
			}
			Pzn.create(data)
		end	
	end
end
