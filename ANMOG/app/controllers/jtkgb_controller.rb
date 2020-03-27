class JtkgbController < ApplicationController
        def index
                @kosten_aktuell = Jtkgb.all
        end


        def create
                @jtkgb = Jtkgb.new(aktuell_params)
                @zw = Jtkgba.all.count + 1
                if @jtkgb.pzn_eins.present?
                        trigger_create(@jtkgb.pzn_eins, @jtkgb.verfahren, @jtkgb.dosierung_eins)
                end
                if @jtkgb.pzn_zwei.present?
                        trigger_create(@jtkgb.pzn_zwei, @jtkgb.verfahren, @jtkgb.dosierung_zwei)
                end
                if @jtkgb.pzn_drei.present?
                        trigger_create(@jtkgb.pzn_drei, @jtkgb.verfahren , @jtkgb.dosierung_drei)
                end
                if @jtkgb.pzn_vier.present?
                        trigger_create(@jtkgb.pzn_vier, @jtkgb.verfahren , @jtkgb.dosierung_vier)
                end
                if @jtkgb.pzn_fuenf.present?
                        trigger_create(@jtkgb.pzn_fuenf, @jtkgb.verfahren ,@jtkgb.dosierung_fuenf)
                end
                if @jtkgb.pzn_sechs.present?
                        trigger_create(@jtkgb.pzn_sechs, @jtkgb.verfahren , @jtkgb.dosierung_sechs)
                end
		@jtkgb.save
                redirect_to controller:"jtkak" , action: "new"
        end

        def aktuell_params
                params.require(:Jtkgbs).permit(:id , :subgruppe , :verfahren ,:dosierung_eins ,:dosierung_zwei, :dosierung_drei , :dosierung_vier , :dosierung_fuenf ,:dosierung_sechs , :pzn_eins , :pzn_zwei , :pzn_drei , :pzn_vier , :pzn_fuenf , :pzn_sechs , :eingetragen)
        end

        protected
        def trigger_create(pzn ,verfahren , dosierung)
		@temp = Main.where('"gba_number" = ?' , verfahren).first
                @real = Pzn.where('"pzn" = ?' , pzn).where('"created_at" > ?', @temp.end_procedure).order(:created_at).first
                data ={
                        id: (Jtkgba.maximum(:id) + 1),
                        subgruppe: @jtkgb.subgruppe,
                        dosierung: dosierung,
                        pzn: pzn,
			zuweisung: @zw,
                        hr_ges_netto: (@real.hr_ges/1.19),
                        apu_netto: (@real.apu_hap - (@real.hr_ges/1.19)),
                        kosten_gkv: (@real.vk_ges - @real.apothekenabschlag - @real.hr_ges),
                        jtk_gkv:  ((@real.vk_ges - @real.apothekenabschlag - @real.hr_ges) * dosierung.to_f),
                        jtk_apu_netto: ((@real.apu_hap - (@real.hr_ges/1.19)) * dosierung.to_f),
                        eingetragen: verfahren
                }
                Jtkgba.create(data)
        end
end

