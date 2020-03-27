class IqsubgroupController < ApplicationController
    def index
    end
    def create
      @Duo = Iqsubgroup.new(duo_params)
      @Duo.save
      redirect_to "/main/show"
    end
    def new
      @studiengrp = Studies.all.order(:bezeichnung)
    end
    def duo_params
        params.require(:Iqsubgroups).permit(:id,:anmerkung ,:verfahrensnummer,:itc_sechs , :itc_sieben , :itc_acht , :itc_neun , :itc_zehn , :itc_elf , :itc_zwoelf ,:updated_by , :created_at , :updated_at,:bewertung ,:zvt_status,:subgroup_name, :act,  :itc, :studie_eins, :studie_zwei, :studie_drei ,:studie_vier,:studie_fuenf ,:studie_sechs , :benefit , :nma , :maic , :wahrscheinlichkeit , :itc_eins ,:itc_zwei ,:itc_drei ,:itc_vier ,:itc_fuenf)
    end
    def destroy
        Iqsubgroup.find(params[:id]).destroy
        redirect_to :controller => 'main', :action => 'show'
    end
    def edit
        @gba = Iqsubgroup.find(params[:id])
    end
    def update
        @gba = Iqsubgroup.find(params[:id])
        @gba.update_attributes(update_params)
        redirect_to  :controller => 'main', :action => 'show'
    end
    def update_params
        params.require(:iqsubgroup).permit(:verfahrensnummer,:anmerkung,:bewertung,:updated_by ,:subgroup_name,:updated_at,:zvt_status, :act, :itc, :studie_eins,:itc_sechs , :itc_sieben , :itc_acht , :itc_neun , :itc_zehn , :itc_elf , :itc_zwoelf, :studie_zwei, :studie_drei ,:studie_vier,:studie_fuenf ,:studie_sechs, :benefit , :nma , :maic , :wahrscheinlichkeit , :itc_eins ,:itc_zwei ,:itc_drei ,:itc_vier ,:itc_fuenf)
    end
end
