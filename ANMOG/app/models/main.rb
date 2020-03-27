class Main < ApplicationRecord
  require 'csv'
  def self.to_csv
    attributes = %w{gba_number drug_name  brand_name manufacturer field_of_application status orphan_drug indication label} 
    headers = %w{Verfahrensnummmer Wirkstoff Handelsname Hersteller Anwendungsgebiet Status Orphan Indikation Label}

    CSV.generate(headers: true) do |csv|
      csv << headers

      all.each do |main|
        csv << attributes.map{ |attr| main.send(attr) }
      end
    end
  end
end
