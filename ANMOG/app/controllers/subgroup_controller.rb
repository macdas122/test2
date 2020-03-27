class SubgroupController < ApplicationController

    def index
    end

    def create
        @Subgroup = Subgroup.new(subgroup_params)
        @Subgroup.save
        redirect_to "/main/show"
    end
    def new
      @studiengrp = Studies.all.order(:bezeichnung)
    end
    def subgroup_params
        params.require(:Subgroups).permit(:id , :verfahrensnummer, :anmerkung ,:zvt_status,:itc_sechs , :itc_sieben , :itc_acht , :itc_neun , :itc_zehn , :itc_elf , :itc_zwoelf ,:created_at ,:updated_by , :updated_at,:subgroup_name , :act , :itc, :nma , :maic ,:studie_eins , :studie_zwei , :studie_drei , :studie_vier , :studie_fuenf , :studie_sechs  ,:itc_eins , :itc_zwei, :itc_drei , :itc_vier , :itc_fuenf, :wahrscheinlichkeit , :benefit)
    end

    def destroy
	Subgroup.find(params[:id]).destroy
        redirect_to :controller => 'main', :action => 'show'
    end

    def edit
	@subgroup = Subgroup.find(params[:id])
        @studie = Studies.find_by_sql(
        "
        SELECT DISTINCT
                studies.bezeichnung,
		studies.id
        FROM studies
        GROUP BY
                studies.id
        ORDER BY
                studies.bezeichnung
        "
        )
    end

    def update
	@subgroup = Subgroup.find(params[:id])
	@subgroup.update_attributes(update_params)
	redirect_to :controller => 'main', :action => 'show'
    end
   
    def update_params
        params.require(:subgroup).permit(:verfahrensnummer,:subgroup_name , :anmerkung,:act ,:zvt_status, :itc_sechs , :itc_sieben , :itc_acht , :itc_neun , :itc_zehn , :itc_elf , :itc_zwoelf ,:itc, :nma ,:updated_by ,:updated_at, :maic ,:studie_eins , :studie_zwei , :studie_drei , :studie_vier , :studie_fuenf , :studie_sechs ,:itc_eins , :itc_zwei, :itc_drei , :itc_vier , :itc_fuenf, :wahrscheinlichkeit , :benefit)
    end
end
