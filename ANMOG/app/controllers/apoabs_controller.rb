class ApoabsController < ApplicationController

  def create
    @Apoab = Apoab.new(ap_params)
    @Apoab.save
    redirect_to :controller => 'main' , :action => 'create'
  end

  def index
  end

  def ap_params
	params.require(:Apoabs).permit(:id, :start , :end , :preis, :eingetragen)
  end

  def destroy
	Apoab.find(params[:id]).destroy
	redirect_to :controller => 'main' , :action => 'show'
  end

  def edit
  end

  def update
  end
 
  def update_params
        params.require(:Apoabs).permit( :start , :end , :preis, :eingetragen)
  end
end
