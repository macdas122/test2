class GbasubgroupController < ApplicationController
    def index
    end
    def create
      @Duo = Gbasubgroup.new(duo_params)
      @Duo.save
      redirect_to "/main/show"
    end

    def new
      @studiengrp = Studies.all.order(:bezeichnung)
    end

    def duo_params
        params.require(:Gbasubgroups).permit(:id, :zvt_status ,:datum_preisverhandlung ,:itc_sechs , :itc_sieben , :itc_acht , :itc_neun , :itc_zehn , :itc_elf , :itc_zwoelf,:updated_by ,:anmerkung,:created_at , :updated_at,:verfahrensnummer, :subgroup_name, :itc,:nma ,:maic , :studie_eins, :studie_zwei, :studie_drei ,:studie_vier,:studie_fuenf,:studiesex, :population_min, :population_max , :wahrscheinlichkeit, :benefit , :itc_eins , :itc_zwei ,:itc_drei ,:itc_vier ,:itc_fuenf ,:jahrestherapiekosten_gba_min , :jahrestherapiekosten_gba_max , :zvt_name_eins , :zvt_name_zwei , :zvt_name_drei , :zvt_name_vier , :zvt_name_fuenf , :zvt_name_sechs , :zvt_name_sieben , :zvt_name_acht , :zvt_name_neun , :zvt_name_zehn , :zvt_eins_min ,:zvt_eins_max ,:zvt_zwei_min ,:zvt_zwei_max,:zvt_drei_min, :zvt_drei_max ,:zvt_vier_min ,:zvt_vier_max ,:zvt_fuenf_min ,:zvt_fuenf_max ,:zvt_sechs_min ,:zvt_sechs_max ,:zvt_sieben_min ,:zvt_sieben_max , :zvt_acht_min ,:zvt_acht_max , :zvt_neun_min ,:zvt_neun_max , :zvt_zehn_min , :zvt_zehn_max)
    end
    def destroy
        Gbasubgroup.find(params[:id]).destroy
        redirect_to :controller => 'main', :action => 'show'
    end
    def edit
        @gba = Gbasubgroup.find(params[:id])
    end
    def update
	@gba = Gbasubgroup.find(params[:id])
	@gba.update_attributes(update_params)
	redirect_to  :controller => 'main', :action => 'show'
    end
    def update_params
        params.require(:gbasubgroup).permit(:verfahrensnummer,:zvt_status ,:updated_by ,:anmerkung, :subgroup_name,:updated_at, :itc,:nma ,:maic , :datum_preisverhandlung ,:itc_sechs , :itc_sieben , :itc_acht , :itc_neun , :itc_zehn , :itc_elf , :itc_zwoelf,:studie_eins, :studie_zwei, :studie_drei ,:studie_vier,:studie_fuenf,:studiesex, :population_min, :population_max , :wahrscheinlichkeit, :benefit , :itc_eins , :itc_zwei ,:itc_drei ,:itc_vier ,:itc_fuenf ,:jahrestherapiekosten_gba_min , :jahrestherapiekosten_gba_max , :zvt_name_eins , :zvt_name_zwei , :zvt_name_drei , :zvt_name_vier , :zvt_name_fuenf , :zvt_name_sechs , :zvt_name_sieben , :zvt_name_acht , :zvt_name_neun , :zvt_name_zehn , :zvt_eins_min ,:zvt_eins_max ,:zvt_zwei_min ,:zvt_zwei_max,:zvt_drei_min, :zvt_drei_max ,:zvt_vier_min ,:zvt_vier_max ,:zvt_fuenf_min ,:zvt_fuenf_max ,:zvt_sechs_min ,:zvt_sechs_max ,:zvt_sieben_min ,:zvt_sieben_max , :zvt_acht_min ,:zvt_acht_max , :zvt_neun_min ,:zvt_neun_max , :zvt_zehn_min , :zvt_zehn_max)
    end
end
