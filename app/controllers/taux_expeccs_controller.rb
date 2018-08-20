class TauxExpeccsController < ApplicationController
  before_action :set_taux_expecc, only: [:edit, :update, :destroy]

  def new
    @taux_expecc = TauxExpecc.new
  end

  def edit; end

  def create
    @taux_expecc = TauxExpecc.new(taux_expecc_params)

    if @taux_expecc.save
      redirect_to indicateurs_path, notice: 'Donnée créée avec succès.'
    else
      render :new
    end
  end

  def update
    if @taux_expecc.update(taux_expecc_params)
      redirect_to indicateurs_data_path, notice: 'Donnée modifiée avec succès.'
    else
      render :edit
    end
  end

  def destroy
    @taux_expecc.destroy
    redirect_to indicateurs_data_path, notice: 'Donnée supprimée avec succès.'
  end

  private

  def set_taux_expecc
    @taux_expecc = TauxExpecc.find(params[:id])
  end

  def taux_expecc_params
    params.require(:taux_expecc).permit(:cmd, :obj, :total)
  end
end
