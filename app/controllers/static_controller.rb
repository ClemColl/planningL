class StaticController < ApplicationController
  def suivi
    @date_range = [
      "S#{(Date.today - 8.week).cweek}",
      "S#{(Date.today - 7.week).cweek}",
      "S#{(Date.today - 6.week).cweek}",
      "S#{(Date.today - 5.week).cweek}",
      "S#{(Date.today - 4.week).cweek}",
      "S#{(Date.today - 3.week).cweek}",
      "S#{(Date.today - 2.week).cweek}",
      "S#{(Date.today - 1.week).cweek}",
      "S#{Date.today.cweek}",
      "S#{(Date.today + 1.week).cweek}",
      "S#{(Date.today + 2.week).cweek}",
      "S#{(Date.today + 3.week).cweek}",
      "S#{(Date.today + 4.week).cweek}"
    ]

    @prod_date = Equipe.first.analyzes
                       .where(duree: 'jour')
                       .last(5)
                       .pluck(:created_at).map { |a| (a-1.day).strftime('%d/%m') }

    @month_range = [
      (Date.today - 8.month).strftime('%b').first,
      (Date.today - 7.month).strftime('%b').first,
      (Date.today - 6.month).strftime('%b').first,
      (Date.today - 5.month).strftime('%b').first,
      (Date.today - 4.month).strftime('%b').first,
      (Date.today - 3.month).strftime('%b').first,
      (Date.today - 2.month).strftime('%b').first,
      (Date.today - 1.month).strftime('%b').first,
      Date.today.strftime('%b').first,
      (Date.today + 1.month).strftime('%b').first,
    ]
    # dates = Date.commercial(Date.today.year, (Date.today.beginning_of_quarter+7.days).cweek, 3).cweek..Date.today.end_of_quarter.cweek
    # dates.each { |s| @date_range << "S#{s}" }

    respond_to do |format|
      format.html do
        quart = ((Date.today - 1.week).month / 3.0).ceil
        range = (Date.today - 4.months)..(Date.today + 1.week)

        ## Button Last Week ##
        @stock_last_week = Stock.last ? "S#{Stock.last.week}" : 'Pas de données'
        @backlog_last_week = Backlog.last ? "S#{Backlog.last.week}" : 'Pas de données'

        # Data
        @machines = Machine.all

        @rapports = []
        @machines.each do |m|
          raps = m.rapports.where(quart: quart, created_at: range)
          @rapports << raps unless raps.empty?
        end

        @stock = Stock.where(quart: quart, created_at: range)
        @backlog = Backlog.where(quart: quart, created_at: range)
        @risques = Appro.last(8)
        @projections = Projection.all
        @ctrl = SuiviPerf.last(8)
        @tmps_fab = TempsFab.last(8)
        @nb_garanti = NbGarantie.last(8)
        @suivi_indic = SuiviInfic.last(8)

      end

      format.pdf do
        @machines_charts = []

        Machine.all.each do |m|
          @machines_charts << params["#{m.name.parameterize.underscore}_base64".to_sym]
        end

        @stock = params['stock_base64'.to_sym]
        @backlog = params['backlog_base64'.to_sym]
        @ytd = params['ytd_base64'.to_sym]

        @productivite = params['prod_base64'.to_sym]
        @risques = params['risques_base64'.to_sym]
        @achat = params['achat_base64'.to_sym]
        @ctrl = params['ctrl_base64'.to_sym]
        @res_prob = params['res_prob_base64'.to_sym]
        @nb_garanti = params['nb_garanti_base64'.to_sym]
        @indics = params['indics_base64'.to_sym]

        render pdf: "Suivi_activité_S#{Date.today.cweek - 1}",
               layout: 'pdf.html',
               disposition: 'inline',
               viewport_size: '1280x1024'
      end
    end
  end

  def bugfix
    @rapports = Rapport.all.order(:machine_id).last(Machine.all.count * 6)
    @stocks = Stock.last(8)
    @backlogs = Backlog.last(8)
    @risques = Appro.last(8)
    @projections = Projection.last(4)
    @ctrl = SuiviPerf.last(8)
    @tmps_fab = TempsFab.last(8)
    @nb_garanti = NbGarantie.last(8)
    @suivi_indic = SuiviInfic.last(8)
  end
end
