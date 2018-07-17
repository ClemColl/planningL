class StaticController < ApplicationController

  def suivi
    respond_to do |format|

      format.html {
        # Date range
        
        @date_range = []
        dates = Date.commercial(Date.today.year, (Date.today.beginning_of_quarter+7.days).cweek, 3).cweek..Date.today.end_of_quarter.cweek
        dates.each{ |s| @date_range << "S#{s}"}
        @range = "'#{@date_range.join("','")}'"

        @nb_semaine = dates.count
        
   
        ## Button Last Week ##
        @stock_last_week = Stock.last ? Stock.last.week.to_s : "Pas de données"
        @backlog_last_week = Backlog.last ? Backlog.last.week.to_s : "Pas de données"

        @machines = Machine.all

      }

      format.pdf {

        @date_range = []
        dates = Date.commercial(Date.today.year, (Date.today.beginning_of_quarter+7.days).cweek, 3).cweek..Date.today.end_of_quarter.cweek
        dates.each{ |s| @date_range << "S#{s}"}

        @machines_charts = []
        
        Machine.all.each do |m|
          @machines_charts << params["#{m.name.parameterize.underscore}_base64".to_sym]
        end
        
        @stock = params["stock_base64".to_sym]
        @backlog = params["backlog_base64".to_sym]
        @ytd = params["ytd_base64".to_sym]

        render :pdf => "Suivi_activité", :layout => 'pdf.html', disposition: "inline",
        viewport_size: '1280x1024'
      }
    end
  end

  def bugfix
    @rapports = Rapport.last(10)
  end

end