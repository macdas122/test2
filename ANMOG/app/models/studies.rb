class Studies < ApplicationRecord
        require 'csv'
        comma_numbers = ->(s) {(s =~ /^\d+,/) ? (s.gsub(',','.').to_f) : s}
        CSV::Converters[:comma_numbers] = comma_numbers
        def self.import(file)

        require 'csv'
                CSV.foreach(file.path , headers: true,  :col_sep => ";",converters: [:all, :comma_numbers]) do |row|
                        data = {
                        id: (Studies.maximum(:id) +1),
                        studien_name: row[0],
                        studien_typ: row[1],
                        safety: row[2],
                        label: row[3],
                        extension: row[4],
                        controlled: row[5],
                        registry: row[6],
                        randomized: row[7],
                        randomization: row[8],
                        population: row[9],
                        evidenz: row[10],
                        annotation: row[11],
                        clinicaltrials: row[12],
                        clinical: row[13],
                        single_arm: row[14],
                        IWT: row[15],
                        multizenter: row[16],
			double_blind: row[17],
			multinational: row[18],
			efficay: row[19],
			bezeichnung: row[20],
			sponsor: row[21],
			dosefinding: row[22],
			ongoing: row[23],
			nhs: row[24],
			updated_by: row[25],
                        created_at:     Time.now,
                        updated_at:     Time.now
                        }
                        Studies.create(data)
                end
        end
end
