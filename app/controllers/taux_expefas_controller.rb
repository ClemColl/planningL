class TauxExpefasController < ApplicationController
  before_action :set_taux_expefa, only: [:edit, :update, :destroy]

  def new
    @taux_expefa = TauxExpefa.new
  end

  def edit; end

  def create
    @taux_expefa = TauxExpefa.new(taux_expefa_params)

    if @taux_expefa.save
      redirect_to indicateurs_path, notice: 'Donnée créée avec succès.'
    else
      render :new
    end
  end

  def update
    if @taux_expefa.update(taux_expefa_params)
      redirect_to indicateurs_data_path, notice: 'Donnée modifiée avec succès.'
    else
      render :edit
    end
  end

  def destroy
    @taux_expefa.destroy
    redirect_to indicateurs_data_path, notice: 'Donnée supprimée avec succès.'
  end

  private

  def set_taux_expefa
    @taux_expefa = TauxExpefa.find(params[:id])
  end

  def taux_expefa_params
    params.require(:taux_expefa).permit(:taux, :obj, :nbligne)
  end
end
