class StaticController < ApplicationController
  def suivi
    @date_range = []
    dates = Date.commercial(Date.today.year, (Date.today.beginning_of_quarter+7.days).cweek, 3).cweek..Date.today.end_of_quarter.cweek
    dates.each { |s| @date_range << "S#{s}" }

    respond_to do |format|
      format.html do

        ## Button Last Week ##
        @stock_last_week = Stock.last ? Stock.last.week.to_s : 'Pas de données'
        @backlog_last_week = Backlog.last ? Backlog.last.week.to_s : 'Pas de données'

        @machines = Machine.all

        @rapports = []
        @machines.each do |m|
          raps = m.rapports.where(quart: ((Date.today-1.week).month/3.0).ceil, created_at: (Date.today-4.months)..(Date.today+1.week))
          @rapports << raps unless raps.empty?
        end

        @stock = Stock.where(quart: ((Date.today - 1.week).month / 3.0).ceil,
                             created_at: (Date.today - 4.months)..(Date.today + 1.week))
      end

      format.pdf do

        @machines_charts = []

        Machine.all.each do |m|
          @machines_charts << params["#{m.name.parameterize.underscore}_base64".to_sym]
        end

        @stock = params['stock_base64'.to_sym]
        @backlog = params['backlog_base64'.to_sym]
        @ytd = params['ytd_base64'.to_sym]

        render pdf: "Suivi_activité_S#{Date.today.cweek-1}",
               layout: 'pdf.html',
               disposition: 'inline',
               viewport_size: '1280x1024'
      end
    end
  end

  def bugfix
    @rapports = Rapport.last(Machine.all.count * 2)
    @stocks = Stock.last(3)
    @backlogs = Backlog.last(3)
  end
end
