class IndicateursController < ApplicationController
  def all
  end

  def production
    ## ALL
    @date_range = []
    dates = Date.commercial(Date.today.year, (Date.today.beginning_of_quarter+7.days).cweek, 3).cweek..Date.today.end_of_quarter.cweek
    dates.each { |s| @date_range << "S#{s}" }

    ## Productivité
    analyzes = Equipe.first.analyzes.where(duree: 'mois').last(13)

    productivite = []
    productivite_objectif = []

    analyzes.count.times do |i|
      productivite[i] = ((analyzes.pluck(:efficacite)[i] * analyzes.pluck(:utilisation)[i]) / 100).round(2)
      productivite_objectif[i] = ((analyzes.pluck(:eff_obj)[i] * analyzes.pluck(:util_obj)[i]) / 100).round(2)
    end

    @prod = productivite
    @prod_obj = productivite_objectif

    ## Rotation des stocks
    data = RotationStock.last(13)
    @rotations = data.pluck(:rotation).map(&:to_f)
    @rotations_obj = data.pluck(:objectif).map(&:to_f)

    ## Analyse temps passés

    data = AnalyseTempsProbleme.last(13)

    @analyses = data.pluck(:tmpdef).map(&:to_f)
    @analyses_obj = data.pluck(:obj).map(&:to_f)
    @analyses_hdirect = data.pluck(:hdirect).map(&:to_i)

    ## Taux d’expédition Equipements
    data = TauxExpe.last(13)

    @equip = data.pluck(:taux).map(&:to_f)
    @equip_obj = data.pluck(:obj).map(&:to_f)

    ## Taux d’expédition FA
    data = TauxExpefa.last(13)

    @expefa = data.pluck(:taux).map(&:to_f)
    @expefa_obj = data.pluck(:obj).map(&:to_f)
    @expefa_nb = data.pluck(:nbligne).map(&:to_i)

    ## Taux d’expédition CC
    data = TauxExpecc.last(13)

    @expecc_cmd = data.pluck(:cmd).map(&:to_f)
    @expecc_obj = data.pluck(:obj).map(&:to_f)
    @expecc_total = data.pluck(:total).map(&:to_f)

    ## Ecart stock
    data = EcartStock.last(13)

    @ecart = data.pluck(:ecart).map(&:to_f)
    @ecart_obj = data.pluck(:obj).map(&:to_f)
    @ecart_val = data.pluck(:valeur).map(&:to_f)
  end

  def suivi
  end

  def prod_results
    eff_file = params[:efficacite]
    util_file = params[:utilisation]
    if eff_data = get_efficacite(eff_file)
      if util_data = get_utilisation(util_file)
        if @duree_eff == @duree_util
          flash[:notice] = 'Analyse réalisée avec succès'

          @equipes = Equipe.all
          objectifs = Objectif.all

          @equipes.each_with_index do |eq, index|
            eq.analyzes.create!(
              duree: @duree_eff,
              efficacite: eff_data.values[index]*100,
              eff_obj: objectifs.first.value,
              utilisation: util_data.values[index]*100,
              util_obj: objectifs.second.value
            )
          end

        else
          flash[:error] = 'Erreur: les durées des fichiers ne correspondent pas'
        end
      else
        flash[:error] = 'Erreur: Impossible de lire le fichier utilisation'
      end
    else
      flash[:error] = 'Erreur: Impossible de lire le fichier efficacité'
    end
  end

  def fichiers; end

  def data
    @rotation = RotationStock.last(13)
    @analyse_temps = AnalyseTempsProbleme.last(13)
    @ecart_stock = EcartStock.last(13)
    @taux_equip = TauxExpe.last(13)
    @taux_fa = TauxExpefa.last(13)
    @taux_client = TauxExpecc.last(13)
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

          ## HARD DATA
          elsif grp_planif == ''
            if desc_op.include?('poste STD') || code_article.start_with?('70601')
              qu2 += d[:quantite_utilisee].to_f
              qr2 += d[:quantite_requise].to_f
            else
              qu3 += d[:quantite_utilisee].to_f
              qr3 += d[:quantite_requise].to_f
            end

          elsif grp_planif == 'A_AFFECTER'
            if code_article.start_with?('ATO_70160')
              qu3 += d[:quantite_utilisee].to_f
              qr3 += d[:quantite_requise].to_f
            else
              qu2 += d[:quantite_utilisee].to_f
              qr2 += d[:quantite_requise].to_f
            end

          elsif grp_planif == 'C_CODA_NS'
            if code_article == '706093'
              qu2 += d[:quantite_utilisee].to_f
              qr2 += d[:quantite_requise].to_f
            else
              qu4 += d[:quantite_utilisee].to_f
              qr4 += d[:quantite_requise].to_f
            end

          elsif grp_planif == 'C_CODA_S'
            if code_article == '706093'
              qu2 += d[:quantite_utilisee].to_f
              qr2 += d[:quantite_requise].to_f
            else
              qu4 += d[:quantite_utilisee].to_f
              qr4 += d[:quantite_requise].to_f
            end

          elsif grp_planif == 'C_EQUIP'
            if desc_op.start_with?('Assemblage') || desc_op.include?('Montage Gros')
              qu1 += d[:quantite_utilisee].to_f
              qr1 += d[:quantite_requise].to_f
            elsif code_article.include?('701495')
              qu2 += d[:quantite_utilisee].to_f
              qr2 += d[:quantite_requise].to_f
            else
              qu5 += d[:quantite_utilisee].to_f
              qr5 += d[:quantite_requise].to_f
            end

          elsif grp_planif == 'PC_EQUIP'
            if desc_op.start_with?('Test FX') || desc_op.start_with?('Transfo')
              qu5 += d[:quantite_utilisee].to_f
              qr5 += d[:quantite_requise].to_f
            elsif desc_op.start_with?('Assemblage FX') || desc_op.start_with?('Finalisation Montage')
              qu1 += d[:quantite_utilisee].to_f
              qr1 += d[:quantite_requise].to_f
            else
              qu3 += d[:quantite_utilisee].to_f
              qr3 += d[:quantite_requise].to_f
            end

          elsif grp_planif == 'PERIPH_PRE'
            if code_article.start_with?('70') || code_article.start_with?('12')
              qu4 += d[:quantite_utilisee].to_f
              qr4 += d[:quantite_requise].to_f
            else
              qu2 += d[:quantite_utilisee].to_f
              qr2 += d[:quantite_requise].to_f
            end

          elsif grp_planif == 'PIL_NS'
            if desc_op.start_with?('Preparation et configuration PC')
              qu1 += d[:quantite_utilisee].to_f
              qr1 += d[:quantite_requise].to_f
            else
              qu2 += d[:quantite_utilisee].to_f
              qr2 += d[:quantite_requise].to_f
            end

          elsif grp_planif == 'SE_COL1_S'
            if code_article.start_with?('7072')
              qu2 += d[:quantite_utilisee].to_f
              qr2 += d[:quantite_requise].to_f
            else
              qu3 += d[:quantite_utilisee].to_f
              qr3 += d[:quantite_requise].to_f
            end

          elsif grp_planif == 'SE_COL3_S'
            if code_article.to_i.between?(706940, 707256) || code_article == '701958A'
              qu2 += d[:quantite_utilisee].to_f
              qr2 += d[:quantite_requise].to_f
            else
              qu3 += d[:quantite_utilisee].to_f
              qr3 += d[:quantite_requise].to_f
            end

          elsif grp_planif == 'SE_RUNN_S'
            if desc_op.include?('zone affutage')
              qu4 += d[:quantite_utilisee].to_f
              qr4 += d[:quantite_requise].to_f
            else
              qu3 += d[:quantite_utilisee].to_f
              qr3 += d[:quantite_requise].to_f
            end

          elsif grp_planif == 'SE_VIB_S'
            if code_article == '705510'
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
      flash[:error] = 'Erreur dans la lecture du fichier efficacité'
    end

    eff_data = {
      fab: (quantite_utilisee / quantite_requise).round(2),
      t1: (qu1 / qr1).round(2),
      t2: (qu2 / qr2).round(2),
      t3: (qu3 / qr3).round(2),
      t4: (qu4 / qr4).round(2),
      t5: (qu5 / qr5).round(2)
    }

    if dates.count == 1
      @duree_eff = 'jour'
    elsif dates.count < 7
      @duree_eff = 'semaine'
    else
      @duree_eff = 'mois'
    end

    return eff_data
  end

  def get_utilisation(file_url)
    dates = []

    if lines = parse_txt_tab(file_url)
      equipes = {}
      util_data = {}
      Equipe.all.each do |eq|

        equipes[eq.id] = {
          indi: 0,
          di: 0,
          prod: 0,
          employees: []
        }

        eq.personnes.each do |per|
          equipes[eq.id][:employees] << per.name
        end

      end

      lines.each do |d|

        if dates.include?(d[:date_de_la_transaction])
        else
          dates << d[:date_de_la_transaction]
        end

        if d[:produit] == 'HEURES_INDIRECTES'
          equipes[1][:indi] += d[:temps_reel_renseigne].to_f.round(2)
          equipes.drop(1).each do |eq|
            if eq[1][:employees].include?(d[:employe])
              eq[1][:indi] += d[:temps_reel_renseigne].to_f.round(2)
            end
          end

        elsif d[:produit] == 'HEURES_NON_DISPONIBLES' && d[:description_de_l_operation].start_with?('Heures cedees DI*')
          equipes[1][:di] += d[:temps_reel_renseigne].to_f.round(2)
          equipes.drop(1).each do |eq|
            if eq[1][:employees].include?(d[:employe])
              eq[1][:di] += d[:temps_reel_renseigne].to_f.round(2)
            end
          end
        end

        if d[:wip_class] == 'PROD2'
          equipes[1][:prod] += d[:temps_reel_renseigne].to_f.round(2)
          equipes.drop(1).each do |eq|
            if eq[1][:employees].include?(d[:employe])
              eq[1][:prod] += d[:temps_reel_renseigne].to_f.round(2)
            end
          end
        end

      end
    else
      flash[:error] = 'Erreur dans la lecture du fichier utilisation'
    end

    if dates.count == 1
      @duree_util = 'jour'
    elsif dates.count < 7
      @duree_util = 'semaine'
    else
      @duree_util = 'mois'
    end

    Equipe.all.each do |eq|

      util_data[eq.id] = (equipes[eq.id][:prod] / (equipes[eq.id][:prod] + equipes[eq.id][:indi] + equipes[eq.id][:di])).round(2)

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
    data == 'C_ARBRE_NS' || data == 'C_ARBRE_S' || data == 'PIL_S'
  end

  def initial_t2(data)
    data == 'SE_COL_TAB' || data == 'VERS_EQUIP' || data == 'VERS_PDET' || data == 'VERS_SE' || data == 'VG_ASS_DEC' || data == 'VG_ASS_MOD' || data == 'VG_SE'
  end

  def initial_t3(data)
    data == "ALYS_ASS" || data == "GC_ASS_CO" || data == "GC_ASS_TT" || data == "PC_ASS_CO" || data == "PC_ASS_TT" || data == "PC_PDET" || data == "PPRINT_ASS" || data == "PRSPIN_ASS" || data == "SE_AFF_NS" || data == "SE_AFF_S" || data == "SE_COL1_NS" || data == "SE_COL2_NS" || data == "SE_COL2_S" || data == "SE_PER_NS" || data == "SE_PER_S" || data == "SE_RUNN_NS" || data == "SE_VIB_NS"
  end

  def initial_t4(data)
    data == "PC_BAIE_NS" || data == "PC_BAIE_S" || data == "PC_TURB_NS" || data == "PC_TURB_S" || data == "SE_CAPO_NS" || data == "SE_CAPO_S" || data == "SE_EMOB_NS" || data == "SE_EMOB_S"
  end

  def initial_t5(data)
    data == 'FQ-EQUIP' || data == 'FQ-PDET'
  end
end
