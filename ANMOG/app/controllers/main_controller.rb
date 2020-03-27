class MainController < ApplicationController
    def index
    render :layout => false

    end
    def new
	
    end
    def create
      @Main = Main.new(main_params)
      @Main.save
      redirect_to controller:"main" , action: "show"
    end

    def main_params
	 params.require(:Main).permit(:id,:updated_by ,:gba_number,:label,:created_at, :updated_at ,:erst_einreichung ,:drug_name,:befristung , :over_one_million, :brand_name, :manufacturer, :orphan_drug, :new_field, :expired_time, :basic_evidence, :exceedance_money, :lors_of_odd, :start_procedure, :end_procedure, :status, :field_of_application, :indication, :subgroups,:benefit_percentige ,:science)
    end
    def show
        @main_delete = Main.find_by_sql(
	"SELECT
		mains.id,
		mains.gba_number,
		mains.drug_name
	FROM mains
	GROUP BY
		mains.id
	ORDER BY
		mains.gba_number	
	"	
	)
        @pc_delete = Subgroup.find_by_sql(
        "SELECT
                subgroups.id,
                subgroups.verfahrensnummer,
                subgroups.subgroup_name
        FROM subgroups
        GROUP BY
                subgroups.id
        ORDER BY
                subgroups.verfahrensnummer
        "
        )
        @gba_delete = Gbasubgroup.find_by_sql(
	"SELECT
		gbasubgroups.id,
		gbasubgroups.verfahrensnummer,
		gbasubgroups.subgroup_name
	FROM gbasubgroups
	GROUP BY
		gbasubgroups.id
	ORDER BY
		gbasubgroups.verfahrensnummer
	"
	)
        @iq_delete = Iqsubgroup.find_by_sql(
        "SELECT
                iqsubgroups.id,
                iqsubgroups.verfahrensnummer,
                iqsubgroups.subgroup_name
        FROM iqsubgroups
        GROUP BY
                iqsubgroups.id
        ORDER BY
                iqsubgroups.verfahrensnummer
        "
        )

        @studie_delete = Studies.find_by_sql(
        "SELECT
                studies.id,
                studies.bezeichnung,
                studies.studien_typ
        FROM studies
        GROUP BY
                studies.id
        ORDER BY
                studies.bezeichnung
        "
        )

        @studiearm_delete = StudyArm.find_by_sql(
        "SELECT
                study_arms.id,
                study_arms.stud_name,
                study_arms.controlled_intervention,
		study_arms.bezeichnung,
		study_arms.number_patient
        FROM study_arms
        GROUP BY
                study_arms.id
        ORDER BY
                study_arms.stud_name
        "
        )

        @endpunkt_delete = Endpoint.find_by_sql(
        "SELECT
                endpoints.id,
                endpoints.bezeichnung,
                endpoints.study
        FROM endpoints
        GROUP BY
                endpoints.id
        ORDER BY
                endpoints.study
        "
        )
	@jtkakt = Jtkakt.find_by_sql(
	"SELECT
		jtkakts.id,
		jtkakts.eingetragen,
		jtkakts.subgruppe,
		jtkakts.pzn,
		jtkakts.dosierung,
		jtkakts.zuweisung,
		jtkakts.jtk_apu_netto
	FROM jtkakts
	GROUP BY
		 jtkakts.id
	ORDER BY
		jtkakts.eingetragen,
		jtkakts.zuweisung
	"
	)
       @jtkpvh = Jtkpvh.find_by_sql(
        "SELECT
                jtkpvhs.id,
                jtkpvhs.eingetragen,
                jtkpvhs.subgruppe,
                jtkpvhs.pzn,
                jtkpvhs.dosierung,
                jtkpvhs.zuweisung,
                jtkpvhs.jtk_apu_netto
        FROM jtkpvhs
        GROUP BY
                 jtkpvhs.id
        ORDER BY
                jtkpvhs.eingetragen,
                jtkpvhs.zuweisung
        "
        )
       @jtkgba = Jtkgba.find_by_sql(
        "SELECT
                jtkgbas.id,
                jtkgbas.eingetragen,
                jtkgbas.subgruppe,
                jtkgbas.pzn,
                jtkgbas.dosierung,
                jtkgbas.zuweisung,
		jtkgbas.jtk_gkv,
                jtkgbas.jtk_apu_netto
        FROM jtkgbas
        GROUP BY
                 jtkgbas.id
        ORDER BY
                jtkgbas.eingetragen,
                jtkgbas.zuweisung
        "
        )
	@preis_anmerkung = PreisAnmerkung.find_by_sql(
	"SELECT
		preis_anmerkungs.id,
		preis_anmerkungs.verfahrensnummer,
		preis_anmerkungs.anmerkung
	FROM preis_anmerkungs
	GROUP BY
		preis_anmerkungs.id
	ORDER BY
		preis_anmerkungs.verfahrensnummer
	"
	)


    end

    def destroy 
	Main.find(params[:id]).destroy
        redirect_to :controller => 'main', :action => 'show'
     end

    def edit
     @main = Main.find(params[:id])
    end
 
    def update
     @main = Main.find(params[:id])
     @main.update_attributes(update_params)
     redirect_to @main

    end
    def update_params
	params.require(:main).permit(:gba_number ,:updated_by,:updated_at, :drug_name, :brand_name,:label ,:erst_einreichung, :over_one_million , :befristung ,:manufacturer, :orphan_drug , :new_field, :expired_time, :basic_evidence, :exceedance_money, :lors_of_odd, :start_procedure, :end_procedure, :status, :field_of_application, :indication, :subgroups,:benefit_percentige ,:benefit, :science)
    end
end

