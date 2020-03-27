class JtkakController < ApplicationController
	def index
		@kosten_aktuell = Jtkak.all
	end

	def new
		@pzngrp = Pzn.find_by_sql(
		"SELECT DISTINCT
			pzns.pzn
		 FROM pzns
		 GROUP BY
			pzns.pzn
		 ORDER BY
			pzns.PZN
		"
		)
	end
	def create
		@jtkak = Jtkak.new(aktuell_params)
		@zw = Jtkakt.all.count + 1
		if @jtkak.pzn_eins.present?
			trigger_create(@jtkak.pzn_eins , @jtkak.dosierung_eins , @jtkak.eingetragen)
		end
                if @jtkak.pzn_zwei.present?
                        trigger_create(@jtkak.pzn_zwei, @jtkak.dosierung_zwei , @jtkak.eingetragen)
                end
                if @jtkak.pzn_drei.present?
                        trigger_create(@jtkak.pzn_drei, @jtkak.dosierung_drei , @jtkak.eingetragen)
                end
                if @jtkak.pzn_vier.present?
                        trigger_create(@jtkak.pzn_vier , @jtkak.dosierung_vier , @jtkak.eingetragen)
                end
                if @jtkak.pzn_fuenf.present?
                        trigger_create(@jtkak.pzn_fuenf, @jtkak.dosierung_fuenf , @jtkak.eingetragen)
                end
                if @jtkak.pzn_sechs.present?
                        trigger_create(@jtkak.pzn_sechs, @jtkak.doesierung_sechs , @jtkak.eingetragen)
                end
		@jtkak.save
		redirect_to controller:"jtkak" , action: "new"
	end

	def aktuell_params
		params.require(:Jtkaks).permit(:id , :subgruppe , :dosierung_eins , :dosierung_zwei , :dosierung_drei , :dosierung_vier , :dosierung_fuenf , :dosierung_sechs , :pzn_eins , :pzn_zwei , :pzn_drei , :pzn_vier , :pzn_fuenf , :pzn_sechs , :eingetragen)
	end
	
	protected
	def trigger_create(pzn , dosierung, verfahren)
		@real = Pzn.where('"pzn" = ?' , pzn).order(:created_at).last
		data ={
                	id: (Jtkakt.maximum(:id) + 1),
                	subgruppe: @jtkak.subgruppe,
                	dosierung: dosierung,
                	pzn: pzn,
			zuweisung: @zw,
                	hr_ges_netto: (@real.hr_ges/1.19),
			rabatt_ges: (((@real.hr_ges/1.19) + @real.nbr) / @real.ppu) ,
                	apu_netto: (@real.apu_hap - (@real.hr_ges/1.19)),
                	kosten_gkv: (@real.vk_ges - @real.apothekenabschlag - @real.hr_ges),
                	jtk_gkv:  ((@real.vk_ges - @real.apothekenabschlag - @real.hr_ges) * dosierung.to_f),
                	jtk_apu_netto: ((@real.apu_hap - (@real.hr_ges/1.19)) * dosierung.to_f),
                	eingetragen: verfahren
                }
                Jtkakt.create(data)
        end
end
