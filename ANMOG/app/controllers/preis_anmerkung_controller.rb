class PreisAnmerkungController < ApplicationController
    def create
        @preis_anmerkung = PreisAnmerkung.new(preis_anmerkung_params)
	@preis_anmerkung.save
	redirect_to controller: "preis_anmerkung" , action: "new"
    end
    def preis_anmerkung_params
	params.require(:Preis_anmerkungs).permit(:id , :verfahrensnummer , :anmerkung)
    end
    def destroy
	PreisAnmerkung.find(params[:id]).destroy
	redirect_to controller: "main" , action: "show"
    end
    def edit
	@preis_anmerkung = PreisAnmerkung.find(params[:id])
    end
    def update
        @preis_anmerkung = PreisAnmerkung.find(params[:id])
	@preis_anmerkung.update_attributes(update_params)
        redirect_to controller: "main" , action: "show"
    end
    def update_params
	params.require(:preis_anmerkung).permit(:verfahrensnummer , :anmerkung)
    end
end
