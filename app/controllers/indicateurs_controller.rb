class IndicateursController < ApplicationController
  
  def all
  end

  def suivi
  end

  def prod_results
    eff_file = params[:efficacite]
    util_file = params[:utilisation]
    if eff_data = get_efficacite(eff_file)
      if util_data = get_utilisation(util_file)
        if @duree_eff == @duree_util
          flash[:notice] = "Analyse réalisée avec succès"

          equipes = Equipe.all

          equipes[0].analyzes.create(
            duree: @duree_eff,
            efficacite: (eff_data[:t1][:qu]/eff_data[:t1][:qr]).round(2),
            utilisation: 0
          )

          equipes[1].analyzes.create(
            duree: @duree_eff,
            efficacite: (eff_data[:t2][:qu]/eff_data[:t2][:qr]).round(2),
            utilisation: 0
          )

          equipes[2].analyzes.create(
            duree: @duree_eff,
            efficacite: (eff_data[:t3][:qu]/eff_data[:t3][:qr]).round(2),
            utilisation: 0
          )

          equipes[3].analyzes.create(
            duree: @duree_eff,
            efficacite: (eff_data[:t4][:qu]/eff_data[:t4][:qr]).round(2),
            utilisation: 0
          )

          equipes[4].analyzes.create(
            duree: @duree_eff,
            efficacite: (eff_data[:t5][:qu]/eff_data[:t5][:qr]).round(2),
            utilisation: 0
          )

        else
          flash[:error] = "Erreur: les durées des fichiers ne correspondent pas"
        end
      else
        flash[:error] = "Erreur: Impossible de lire le fichier utilisation"
      end
    else
      flash[:error] = "Erreur: Impossible de lire le fichier efficacité"
    end
  end


  private

  def get_efficacite(file_url)

    if lines = parse_txt_tab(file_url)
      t1, t2, t3, t4, t5 = 0, 0, 0, 0, 0
      quantite_utilisee, quantite_requise = 0, 0
      qu1, qu2, qu3, qu4, qu5 = 0, 0, 0, 0, 0
      qr1, qr2, qr3, qr4, qr5 = 0, 0, 0, 0, 0
      dates = []
    
      lines.each do |d|
        if dates.include?(d[:termine_le])
        else
          dates << d[:termine_le]
        end

        if d[:type_d_of] == "Standard" && d[:wip_class] == "PROD2"
          quantite_utilisee += d[:quantite_utilisee].to_f
          quantite_requise += d[:quantite_requise].to_f
    
          ## VARIABLES
          grp_planif = d[:groupe_de_planification]
          desc_op = d[:description_de_l_operation]
          code_article = d[:produit].split("*").first

          ## EASY DATA
          if initial_t1(grp_planif)
            qu1 += d[:quantite_utilisee].to_f
            qr1 += d[:quantite_requise].to_f
          elsif initial_t2(grp_planif)
            qu2 += d[:quantite_utilisee].to_f
            qr2 += d[:quantite_requise].to_f
          elsif initial_t3(grp_planif)
            qu3 += d[:quantite_utilisee].to_f
            qr3 += d[:quantite_requise].to_f
          elsif initial_t4(grp_planif)
            qu4 += d[:quantite_utilisee].to_f
            qr4 += d[:quantite_requise].to_f
          elsif initial_t5(grp_planif)
            qu5 += d[:quantite_utilisee].to_f
            qr5 += d[:quantite_requise].to_f
    
          #HARD DATA
          elsif grp_planif == ""
            if desc_op.include?("poste STD") || code_article.start_with?("70601")
              qu2 += d[:quantite_utilisee].to_f
              qr2 += d[:quantite_requise].to_f
            else
              qu3 += d[:quantite_utilisee].to_f
              qr3 += d[:quantite_requise].to_f
            end
    
          elsif grp_planif == "A_AFFECTER"
            if code_article.start_with?("ATO_70160")
              qu3 += d[:quantite_utilisee].to_f
              qr3 += d[:quantite_requise].to_f
            else
              qu2 += d[:quantite_utilisee].to_f
              qr2 += d[:quantite_requise].to_f
            end
    
          elsif grp_planif == "C_CODA_NS"
            if code_article == "706093"
              qu2 += d[:quantite_utilisee].to_f
              qr2 += d[:quantite_requise].to_f
            else
              qu4 += d[:quantite_utilisee].to_f
              qr4 += d[:quantite_requise].to_f
            end
    
          elsif grp_planif == "C_CODA_S"
            if code_article == "706093"
              qu2 += d[:quantite_utilisee].to_f
              qr2 += d[:quantite_requise].to_f
            else
              qu4 += d[:quantite_utilisee].to_f
              qr4 += d[:quantite_requise].to_f
            end
    
          elsif grp_planif == "C_EQUIP"
            if desc_op.start_with?("Assemblage") || desc_op.include?("Montage Gros")
              qu1 += d[:quantite_utilisee].to_f
              qr1 += d[:quantite_requise].to_f
            elsif code_article.include?("701495")
              qu2 += d[:quantite_utilisee].to_f
              qr2 += d[:quantite_requise].to_f
            else
              qu5 += d[:quantite_utilisee].to_f
              qr5 += d[:quantite_requise].to_f
            end
    
          elsif grp_planif == "PC_EQUIP"
            if desc_op.start_with?("Test FX") || desc_op.start_with?("Transfo")
              qu5 += d[:quantite_utilisee].to_f
              qr5 += d[:quantite_requise].to_f
            elsif desc_op.start_with?("Assemblage FX") || desc_op.start_with?("Finalisation Montage")
              qu1 += d[:quantite_utilisee].to_f
              qr1 += d[:quantite_requise].to_f
            else
              qu3 += d[:quantite_utilisee].to_f
              qr3 += d[:quantite_requise].to_f
            end
    
    
          elsif grp_planif == "PERIPH_PRE"
            if code_article.start_with?("70") || code_article.start_with?("12")
              qu4 += d[:quantite_utilisee].to_f
              qr4 += d[:quantite_requise].to_f
            else
              qu2 += d[:quantite_utilisee].to_f
              qr2 += d[:quantite_requise].to_f
            end
    
          elsif grp_planif == "PIL_NS"
            if desc_op.start_with?("Preparation et configuration PC")
              qu1 += d[:quantite_utilisee].to_f
              qr1 += d[:quantite_requise].to_f
            else
              qu2 += d[:quantite_utilisee].to_f
              qr2 += d[:quantite_requise].to_f
            end
    
          elsif grp_planif == "SE_COL1_S"
            if code_article.start_with?("7072")
              qu2 += d[:quantite_utilisee].to_f
              qr2 += d[:quantite_requise].to_f
            else
              qu3 += d[:quantite_utilisee].to_f
              qr3 += d[:quantite_requise].to_f
            end
    
          elsif grp_planif == "SE_COL3_S"
            if code_article.to_i.between?(706940, 707256) || code_article == "701958A"
              qu2 += d[:quantite_utilisee].to_f
              qr2 += d[:quantite_requise].to_f
            else
              qu3 += d[:quantite_utilisee].to_f
              qr3 += d[:quantite_requise].to_f
            end
    
          elsif grp_planif == "SE_RUNN_S"
            if desc_op.include?("zone affutage")
              qu4 += d[:quantite_utilisee].to_f
              qr4 += d[:quantite_requise].to_f
            else
              qu3 += d[:quantite_utilisee].to_f
              qr3 += d[:quantite_requise].to_f
            end
    
          elsif grp_planif == "SE_VIB_S"
            if code_article == "705510"
              qu2 += d[:quantite_utilisee].to_f
              qr2 += d[:quantite_requise].to_f
            else
              qu3 += d[:quantite_utilisee].to_f
              qr3 += d[:quantite_requise].to_f
            end
          end
        end
      end
    else
      flash[:error] = "Erreur dans la lecture du fichier efficacité"
    end

    eff_data = {
      fab: {
        qu: quantite_utilisee.round(2),
        qr: quantite_requise.round(2)
      },
      t1: {
        qu: qu1.round(2),
        qr: qr1.round(2)
      },
      t2: {
        qu: qu2.round(2),
        qr: qr2.round(2)
      },
      t3: {
        qu: qu3.round(2),
        qr: qr3.round(2)
      },
      t4: {
        qu: qu4.round(2),
        qr: qr4.round(2)
      },
      t5: {
        qu: qu5.round(2),
        qr: qr5.round(2)
      },
    }

      if dates.count == 1
        @duree_eff = "day"
      elsif dates.count < 7
        @duree_eff = "week"
      else
        @duree_eff = "month"
      end

    return eff_data
  end

  def get_utilisation(file_url)

    if lines = parse_txt_tab(file_url)
      h_abs, h_indi, h_no_dispo = 0, 0, 0                     # HEURES
      h_cedees = {                                            # HEURES CEDEES
        rd: 0,
        rds: 0,
        serv: 0,
        sqf: 0,
        demo: 0,
        di: 0,
        filiale: 0,
        total: 0
      }
      h_prod2, h_recond = 0, 0                                # HEURES PROD ou RECOND
      total_conges_annuel_rtt = 0                             # CONGES
      total_conges_except = 0                                 # CONGES
      names = {}                                              # Personnes

      responsables = []
      Responsable.all.each do |r|
        responsables << r.name.upcase
      end
      dates = []
    
      lines.each do |d|

        if dates.include?(d[:date_de_la_transaction])
        else
          dates << d[:date_de_la_transaction]
        end

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
      util_data = {
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
    else
      flash[:error] = "Erreur dans la lecture du fichier utilisation"
    end

    if dates.count == 1
      @duree_util = "day"
    elsif dates.count < 7
      @duree_util = "week"
    else
      @duree_util = "month"
    end

    return util_data
  end

  def parse_txt_tab(url)
    columns = []
    rows = []

    file = File.open(url.path, "r")
    file.each_with_index do |line, index|
        
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

    data = []
    rows.each do |row|
        h = {}
        columns.zip(row) { |a,b| h[a.to_sym] = b }
        data << h
    end

    return data
  end

  def initial_t1(data)
    data == "C_ARBRE_NS" || data == "C_ARBRE_S" || data == "PIL_S"
  end

  def initial_t2(data)
    data == "SE_COL_TAB" || data == "VERS_EQUIP" || data == "VERS_PDET" || data == "VERS_SE" || data == "VG_ASS_DEC" || data == "VG_ASS_MOD" || data == "VG_SE"
  end

  def initial_t3(data)
    data == "ALYS_ASS" || data == "GC_ASS_CO" || data == "GC_ASS_TT" || data == "PC_ASS_CO" || data == "PC_ASS_TT" || data == "PC_PDET" || data == "PPRINT_ASS" || data == "PRSPIN_ASS" || data == "SE_AFF_NS" || data == "SE_AFF_S" || data == "SE_COL1_NS" || data == "SE_COL2_NS" || data == "SE_COL2_S" || data == "SE_PER_NS" || data == "SE_PER_S" || data == "SE_RUNN_NS" || data == "SE_VIB_NS"
  end

  def initial_t4(data)
    data == "PC_BAIE_NS" || data == "PC_BAIE_S" || data == "PC_TURB_NS" || data == "PC_TURB_S" || data == "SE_CAPO_NS" || data == "SE_CAPO_S" || data == "SE_EMOB_NS" || data == "SE_EMOB_S"
  end

  def initial_t5(data)
    data == "FQ-EQUIP" || data == "FQ-PDET"
  end

end
