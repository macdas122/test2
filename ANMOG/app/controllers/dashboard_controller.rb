class DashboardController < ApplicationController
    def index
        @mains = Main.order(end_procedure: :desc)
	@procedures = Main.where("status = ?", "Verfahren abgeschlossen").pluck(:gba_number)
	@graph = Gbasubgroup.where('verfahrensnummer IN (?)',  @procedures.map).group(:benefit).count
	@graph_two = Gbasubgroup.where('verfahrensnummer IN (?)',  @procedures.map).where("benefit = 'erheblicher Zusatznutzen'").group(:verfahrensnummer).count	

    end
end
