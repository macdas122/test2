class PreisesController < ApllicationController
	def index
		@preise = Preises.all
	end

	def import	
		Preises.import(params[:file])
	end
end
