class EndpointsController < ApplicationController
    caches_page :new
    def index
    end
    def new
      @epcount = Endpoint.maximum(:id) + 1
    end    
    def create
      @Endpoint = Endpoint.new(endpoint_params)
      @Endpoint.save
      redirect_to controller:"endpoints" ,action: "new"
    end

    def endpoint_params
        params.require(:Endpoints).permit(:id, :category,:updated_by ,:bezeichnung,:anmerkung ,:instrument ,:study ,:classification,:herangezogen, :created_at , :updated_at )
    end
    def destroy
        Endpoint.find(params[:id]).destroy
	redirect_to :controller => 'main' , :action => 'show'
    end
    def edit
        @Endpoint = Endpoint.find(params[:id])
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
       @Endpoint = Endpoint.find(params[:id])
       @Endpoint.update_attributes(update_params)
       redirect_to :controller => 'main', :action => 'show' 
    end
    def update_params
        params.require(:endpoint).permit(:category ,:bezeichnung, :updated_by ,:instrument ,:anmerkung,:study ,:classification ,:herangezogen, :updated_at)
    end
    def show
        if params[:keywords].present?
            @keywords = params[:keywords]
            endpoint_search_term = EndpointSearchTerm.new(@keywords)
            @ep = Endpoint.where(
                endpoint_search_term.where_clause,
                endpoint_search_term.where_args).
                order(endpoint_search_term.order).order(:study)
        else
            @ep = Endpoint.all.order(:study)
        end
    end
end    
