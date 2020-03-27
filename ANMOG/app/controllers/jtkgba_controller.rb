class JtkgbaController < ApplicationController
    def destroy
        Jtkgba.find(params[:id]).destroy
        redirect_to :controller => 'dashboard' , :action => 'index'
    end
    def edit
        @jtk = Jtkgba.find(params[:id])
    end
    def update
        @jtk = Jtkgba.find(params[:id])
        @jtk.update_attributes(update_params)
        redirect_to :controller => 'main' , :action => 'index'
    end
    def update_params
        params.require(:jtkgba).permit(:subgruppe)
    end

end

