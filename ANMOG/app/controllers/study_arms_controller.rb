class StudyArmsController < ApplicationController
    def index
    end
    def create
      @Study_arm = StudyArm.new(study_arms_params)
      @Study_arm.save
      redirect_to "/main/show"
    end
    def study_arms_params
      params.require(:Study_arms).permit(:id,:bezeichnung,:zutreffend , :created_at ,:updated_by ,:behandlungsnummer , :behandlungstyp,:anmerkung, :updated_at,:controlled_intervention, :medication ,:dosing , :verabreichnung ,:number_patient, :stud_name)
    end
    def destroy
	StudyArm.find(params[:id]).destroy
        redirect_to  :controller => 'main' , :actrion => 'show'
    end
    def edit
	@Study_arm = StudyArm.find(params[:id])
        @studie = Studies.find_by_sql(
        "
        SELECT DISTINCT
                studies.bezeichnung
        FROM studies
        GROUP BY
                studies.bezeichnung
        ORDER BY
                studies.bezeichnung
        "
        )
    end
    def update
	@Study_arm = StudyArm.find(params[:id])
	@Study_arm.update_attributes(update_params)
        redirect_to :controller => 'main' , :action => 'show'
    end
    def update_params
      params.require(:study_arm).permit(:controlled_intervention,:zutreffend ,:bezeichnung,:anmerkung ,:updated_by ,:updated_at,:behandlungsnummer , :behandlungstyp, :medication ,:dosing , :verabreichnung ,:number_patient, :stud_name)
    end
end
