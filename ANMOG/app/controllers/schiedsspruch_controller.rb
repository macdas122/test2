class SchiedsspruchController < ApplicationController
  def index
	@pricedata = Schiedsspruch.all
  end

  def new
  	@pricedata = Schiedsspruch.new
  end

  def create
	@pricedata = Schiedsspruch.new(pricedata_params)

	@pricedata.save
		redirect_to controller: "dashboard"
  end

  def destroy
  	@pricedata = Schiedsspruch.find(params[:id])
	@pricedata.destroy
	redirect_to main_index_path

  end
  private	
	def pricedata_params
	params.require(:Schiedsspruch).permit(:date ,:verfahrensnummer , :attachment)
  end

end
