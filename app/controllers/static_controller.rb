class StaticController < ApplicationController
  def home
  end

  def suivi
    respond_to do |format|

      format.html {
        # Date range
        
        date_range = []
        dates = Date.commercial(Date.today.year, (Date.today.beginning_of_quarter+7.days).cweek, 3).cweek..Date.today.end_of_quarter.cweek
        dates.each{ |s| date_range << "S#{s}"}
        @range = "'#{date_range.join("','")}'"

        @nb_semaine = dates.count
        
   
        ## Button Last Week ##
        @stock_last_week = Stock.last ? Stock.last.week.to_s : "Pas de données"
        @backlog_last_week = Backlog.last ? Backlog.last.week.to_s : "Pas de données"

        @machines = Machine.all

      }

      format.pdf {
        @machines_charts = []
        
        Machine.all.each do |m|
          @machines_charts << params["#{m.name.parameterize.underscore}_base64".to_sym]
        end
        
        @stock = params["stock_base64".to_sym]
        @backlog = params["backlog_base64".to_sym]

        render :pdf => "suivi_activité", :layout => 'pdf.html'
      }
    end
  end

  def indicateurs
    @efficacite = parse_efficacite
    @utilisation = parse_utilisation
  end

  private

  def parse_efficacite
    # numero_d_of
    # type_d_of
    # produit
    # quantite_initiale
    # wip_class
    # statut_of
    # termine_le
    # groupe_de_planification
    # numero_de_l_operation
    # description_de_l_operation
    # nom_de_la_ressource
    # quantite_requise
    # quantite_utilisee
    # temps_objectif_fab

    data = parse_txt_tab('/Users/zepri/Desktop/testagenda/Lectra___Indicateur_de_suivi_d_efficacité_S22-040618.txt')
    quantite_utilisee = 0
    quantite_requise = 0
    
    data.each do |d|
      if d[:type_d_of] == "Standard" && d[:wip_class] == "PROD2"
        quantite_utilisee += d[:quantite_utilisee].to_f
        quantite_requise += d[:quantite_requise].to_f
      end
    end
    return {utilisee: quantite_utilisee.round(2), requise: quantite_requise.round(2), total: (quantite_requise - quantite_utilisee).round(2) }
  end

  def parse_utilisation
    # date_de_la_transaction
    # numero_d_of
    # produit
    # quantite_initiale
    # type_d_of
    # wip_class
    # statut_of
    # description_of
    # groupe_de_planification
    # numero_de_l_operation
    # description_de_l_operation
    # numero_de_la_ressource
    # nom_de_la_ressource
    # employe
    # quantite_requise
    # temps_reel_renseigne
    # uom
    # raison
    # reference

    data = parse_txt_tab('/Users/zepri/Desktop/testagenda/utilisation.txt')
    h_abs, h_indi, h_no_dispo = 0, 0, 0                     # HEURES
    h_cedees = {rd: 0, rds: 0, serv: 0, sqf: 0, demo: 0, di: 0, filiale: 0, total: 0}   # HEURES CEDEES
    h_prod2, h_recond = 0, 0                                # HEURES PROD ou RECOND
    total_conges_annuel_rtt = 0                             # CONGES
    total_conges_except = 0                                 # CONGES
    names = {}                                              # Personnes
    responsables = []
    Responsable.all.each do |r|
      responsables << r.name.upcase
    end

    data.each do |d|
      if !names.key?(d[:employe])
        names[d[:employe]] = {nonprod: 0, prod2: 0, recond: 0} unless responsables.include?(d[:employe].split.first.gsub(/,/,''))
      end
    
      if d[:produit] == "HEURES_ABSENCES"
        h_abs += d[:temps_reel_renseigne].to_f
    
        if d[:description_de_l_operation].include? "annuels et RTT"
          total_conges_annuel_rtt += d[:temps_reel_renseigne].to_f
        elsif d[:description_de_l_operation].include? "exceptionnels"
          total_conges_except += d[:temps_reel_renseigne].to_f
        end

      elsif d[:produit] == "HEURES_INDIRECTES"
        h_indi += d[:temps_reel_renseigne].to_f
      elsif d[:produit] == "HEURES_NON_DISPONIBLES"
        h_no_dispo += d[:temps_reel_renseigne].to_f
        
        if d[:description_de_l_operation].include? "R&D ("
          h_cedees[:rd] += d[:temps_reel_renseigne].to_f.round(2)
        elsif d[:description_de_l_operation].include? "R&D Soft"
          h_cedees[:rds] += d[:temps_reel_renseigne].to_f.round(2)
        elsif d[:description_de_l_operation].include? "cedees SERVICES"
          h_cedees[:serv] += d[:temps_reel_renseigne].to_f.round(2)
        elsif d[:description_de_l_operation].include? "SQF"
          h_cedees[:sqf] += d[:temps_reel_renseigne].to_f.round(2)
        elsif d[:description_de_l_operation].start_with?("Heures cedees Demo*")
          h_cedees[:demo] += d[:temps_reel_renseigne].to_f.round(2)
        elsif d[:description_de_l_operation].start_with?("Heures cedees DI*")
          h_cedees[:di] += d[:temps_reel_renseigne].to_f.round(2)
        elsif d[:description_de_l_operation].include? "Filiales"
          h_cedees[:filiale] += d[:temps_reel_renseigne].to_f.round(2)
        end
      end
    
      if d[:wip_class] == "PROD2"
        h_prod2 += d[:temps_reel_renseigne].to_f.round(2)
        names[d[:employe]][:prod2] += d[:temps_reel_renseigne].to_f.round(2) if names[d[:employe]]
      elsif d[:wip_class] == "RECOND"
        h_recond += d[:temps_reel_renseigne].to_f.round(2)
        names[d[:employe]][:recond] += d[:temps_reel_renseigne].to_f.round(2) if names[d[:employe]]
      elsif d[:wip_class] == "NONPROD"
        h_recond += d[:temps_reel_renseigne].to_f.round(2)
        names[d[:employe]][:nonprod] += d[:temps_reel_renseigne].to_f.round(2) if names[d[:employe]]
      end
    end
    
    # CALCUL
    h_no_dispo_c = h_no_dispo - h_cedees[:total]
    h_cedees[:total] = (h_cedees[:rd] + h_cedees[:rds] + h_cedees[:serv] + h_cedees[:sqf] + h_cedees[:demo] + h_cedees[:di] + h_cedees[:filiale])


    return {
            abs: h_abs.round(2),
            indi: h_indi.round(2),
            no_dispo: h_no_dispo.round(2),
            no_dispo_c: h_no_dispo_c.round(2),
            total_c: (h_abs + h_indi + h_no_dispo_c).round(2),
            conges_j: ((total_conges_annuel_rtt/7.32)/43).round(2),
            cedees: {
              rd: h_cedees[:rd],
              rds: h_cedees[:rds],
              serv: h_cedees[:serv],
              sqf: h_cedees[:sqf],
              demo: h_cedees[:demo],
              di: h_cedees[:di],
              filiale: h_cedees[:filiale],
              total: h_cedees[:total]
            },
            prod2: h_prod2,
            recond: h_recond,
            total_conges_annuel_rtt: total_conges_annuel_rtt.round(2),
            total_conges_except: total_conges_except.round(2),
            employees: names
          }
  end

  def parse_txt_tab(url)
    columns = []
    rows = []
    limit = 0

    file = File.open(url, "r").each_with_index do |line, index|
        
      if index == 0
        line.split("\t").each do |l|
          columns << l.parameterize.underscore
        end
        columns.last.chomp! # fix last column \T
      else
        line.split("\r\n").each do |l|
          rows << l.split("\t")
        end
      end
    end

    # if columns.first.include? "Numero"
    #   puts "#### EFFICACITE ####"
    # elsif columns.first.include? "Date"
    #   puts "#### UTILISATION ####"
    # end

    data = []
    rows.each do |row|
        h = {}
        columns.zip(row) { |a,b| h[a.to_sym] = b }
        data << h
    end

    return data
  end

end