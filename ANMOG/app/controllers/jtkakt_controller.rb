class JtkaktController < ApplicationController
    def destroy
        Jtkakt.find(params[:id]).destroy
        redirect_to :controller => 'main' , :action => 'show'
    end
    def edit
	@jtk = Jtkakt.find(params[:id])
    end
    def update
	@jtk = Jtkakt.find(params[:id])
	@jtk.update_attributes(update_params)
	redirect_to :controller => 'main' , :action => 'show'
    end
    def update_params
	params.require(:jtkakt).permit(:subgruppe)
    end
    def show
    end
end

