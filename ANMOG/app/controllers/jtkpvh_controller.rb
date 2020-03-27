class JtkpvhController < ApplicationController
    def destroy
        Jtkpvh.find(params[:id]).destroy
        redirect_to :controller => 'main' , :action => 'show'
    end
    def edit
        @jtk = Jtkpvh.find(params[:id])
    end
    def update
        @jtk = Jtkpvh.find(params[:id])
        @jtk.update_attributes(update_params)
        redirect_to :controller => 'main' , :action => 'show'
    end
    def update_params
        params.require(:jtkpvh).permit(:subgruppe)
    end

end
