class TauxExpesController < ApplicationController
  before_action :set_taux_expe, only: [:edit, :update, :destroy]

  def new
    @taux_expe = TauxExpe.new
  end

  def edit; end

  def create
    @taux_expe = TauxExpe.new(taux_expe_params)

    if @taux_expe.save
      redirect_to indicateurs_path, notice: 'Donnée créée avec succès.'
    else
      render :new
    end
  end

  def update
    if @taux_expe.update(taux_expe_params)
      redirect_to indicateurs_data_path, notice: 'Donnée modifiée avec succès.'
    else
      render :edit
    end
  end

  def destroy
    @taux_expe.destroy
    redirect_to indicateurs_data_path, notice: 'Donnée supprimée avec succès.'
  end

  private

  def set_taux_expe
    @taux_expe = TauxExpe.find(params[:id])
  end

  def taux_expe_params
    params.require(:taux_expe).permit(:taux, :obj)
  end
end
