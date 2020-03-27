class JtkpvController < ApplicationController
        def index
                @kosten_aktuell = Jtkpv.all
        end


        def create
                @jtkpv = Jtkpv.new(aktuell_params)
                @zw = Jtkpvh.all.count + 1
                if @jtkpv.pzn_eins.present?
                        trigger_create(@jtkpv.pzn_eins, @jtkpv.datum, @jtkpv.verfahren ,@jtkpv.dosierung_eins)
                end
                if @jtkpv.pzn_zwei.present?
                        trigger_create(@jtkpv.pzn_zwei, @jtkpv.datum, @jtkpv.verfahren ,@jtkpv.dosierung_zwei)
                end
                if @jtkpv.pzn_drei.present?
                        trigger_create(@jtkpv.pzn_drei, @jtkpv.datum, @jtkpv.verfahren ,@jtkpv.dosierung_drei)
                end
                if @jtkpv.pzn_vier.present?
                        trigger_create(@jtkpv.pzn_vier, @jtkpv.datum, @jtkpv.verfahren ,@jtkpv.dosierung_vier)
                end
                if @jtkpv.pzn_fuenf.present?
                        trigger_create(@jtkpv.pzn_fuenf, @jtkpv.datum, @jtkpv.verfahren ,@jtkpv.dosierung_fuenf)
                end
                if @jtkpv.pzn_sechs.present?
                        trigger_create(@jtkpv.pzn_sechs, @jtkpv.datum, @jtkpv.verfahren ,@jtkpv.dosierung_sechs)
                end
		@jtkpv.save
                redirect_to controller:"jtkak" , action: "new"
        end

        def aktuell_params
                params.require(:Jtkpvs).permit(:id , :subgruppe , :dosierung_eins , :dosierung_zwei , :dosierung_drei , :dosierung_vier , :dosierung_fuenf , :dosierung_sechs , :pzn_eins , :pzn_zwei , :pzn_drei , :pzn_vier , :pzn_fuenf , :pzn_sechs , :eingetragen, :verfahren, :datum)
        end

        protected
        def trigger_create(pzn,verfahren,id , dosierung)
                @real = Pzn.where('"pzn" = ?' , pzn).where('"created_at" > ?' , verfahren).order(:created_at).first
                data ={
                        id: (Jtkpvh.maximum(:id) + 1),
                        subgruppe: @jtkpv.subgruppe,
                        dosierung: dosierung,
                        pzn: pzn,
			zuweisung: @zw,
                        hr_ges_netto: (@real.hr_ges/1.19),
			rabatt_ges: (((@real.hr_ges/1.19)+ @real.nbr)/ @real.ppu),
                        apu_netto: (@real.apu_hap - (@real.hr_ges/1.19)),
                        kosten_gkv: (@real.vk_ges - @real.apothekenabschlag - @real.hr_ges),
                        jtk_gkv:  ((@real.vk_ges - @real.apothekenabschlag - @real.hr_ges) * dosierung.to_f),
                        jtk_apu_netto: ((@real.apu_hap - (@real.hr_ges/1.19)) * dosierung.to_f),
                        eingetragen: id
                }
                Jtkpvh.create(data)
        end
end

