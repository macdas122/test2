class PznController < ApplicationController
	def index
                @pzn = Pzn.new
                @edit = Pzn.where('"pzn" = ?', @pzn.pzn).where('"created_at" = ?' , @pzn.created_at).first
	end
	def create
                @pzn = Pzn.new(search_params)
                @edit = Pzn.where('"pzn" = ?' ,  @pzn.pzn).where('"created_at" = ?'  , @pzn.created_at).first
		redirect_to edit_pzn_path(@edit.id)
        end

	def import
		Pzn.import(params[:file])
	        redirect_to mains_path
	end
	def edit
		@pzn = Pzn.find(params[:id])
	end
	def update
		@pzn = Pzn.find(params[:id])
		@pzn.update_attributes(update_params)
		redirect_to :controller => 'pzn' , :action => 'index'
	end
	def search_params
		params.require(:pzn).permit(:pzn ,  :created_at)
	end
	def update_params
		params.require(:pzn).permit(:nbr , :ppu, :apu_hap ,:Artikelname, :apothekenabschlag)
	end
end
