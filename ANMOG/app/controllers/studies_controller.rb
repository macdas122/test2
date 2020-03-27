class StudiesController < ApplicationController
    def index
    end
    def create
      @Studies = Studies.new(study_params)
      @Studies.save
      redirect_to controller:"studies" ,action: "new"
    end

    def study_params
        params.require(:Studies).permit(:id, :studien_name ,:updated_by , :created_at , :updated_at,:studien_typ ,:population,:nhs, :safety , :label , :IWT , :clinical , :single_arm , :extension ,:controlled, :registry , :randomized , :randomization , :population  , :evidenz , :annotation ,:sponsor ,:phase ,:bezeichnung ,:multizenter ,:multinational ,:double_bline ,:efficacy , :dosefinding , :ongoing)
    end
    def destroy
	Studies.find(params[:id]).destroy
        redirect_to :controller => 'main' , :action => 'show'
    end
    def edit
	@Studies = Studies.find(params[:id])
    end
    def update
	@Studies = Studies.find(params[:id])
	@Studies.update_attributes(update_params)
	redirect_to :controller => 'main' , :action => 'show'
    end
    def update_params
               params.require(:studies).permit(:studien_name, :studien_typ ,:updated_by ,:nhs ,:updated_at ,:safety , :label , :IWT , :clinical , :single_arm ,:extension , :controlled , :registry , :randomized , :randomization , :population , :evidenz , :annotation ,:sponsor ,:phase ,:bezeichnung ,:multizenter ,:multinational ,:double_bline ,:efficacy , :dosefinding , :ongoing)
    end
end
