class DashboardController < ApplicationController
    def index
        @mains = Main.order(end_procedure: :desc)
    end
end
