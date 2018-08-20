class AnalyseTempsProblemesController < ApplicationController
  before_action :set_analyse_temps_probleme, only: [:edit, :update, :destroy]

  def new
    @analyse_temps_probleme = AnalyseTempsProbleme.new
  end

  def edit; end

  def create
    @analyse_temps_probleme = AnalyseTempsProbleme.new(analyse_temps_probleme_params)

    if @analyse_temps_probleme.save
      redirect_to indicateurs_path, notice: 'Donnée créée avec succès.'
    else
      render :new
    end
  end

  def update
    if @analyse_temps_probleme.update(analyse_temps_probleme_params)
      redirect_to indicateurs_data_path, notice: 'Donnée modifiée avec succès.'
    else
      render :edit
    end
  end

  def destroy
    @analyse_temps_probleme.destroy
    redirect_to indicateurs_data_path, notice: 'Donnée supprimée avec succès.'
  end

  private

  def set_analyse_temps_probleme
    @analyse_temps_probleme = AnalyseTempsProbleme.find(params[:id])
  end

  def analyse_temps_probleme_params
    params.require(:analyse_temps_probleme).permit(:tmpdef, :obj, :hdirect)
  end
end
