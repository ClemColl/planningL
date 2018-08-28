class NbGarantiesController < ApplicationController
  before_action :set_nb_garanty, only: [:edit, :update, :destroy]

  def new
    @nb_garanty = NbGarantie.new
  end

  def edit; end

  def create
    @nb_garanty = NbGarantie.new(nb_garanty_params)

    if @nb_garanty.save
      redirect_to suivi_path, notice: 'Donnée créée avec succès.'
    else
      render :new
    end
  end

  def update
    if @nb_garanty.update(nb_garanty_params)
      redirect_to suivi_bugfix_path, notice: 'Donnée modifiée avec succès.'
    else
      render :edit
    end
  end

  def destroy
    @nb_garanty.destroy
    redirect_to suivi_bugfix_path, notice: 'Donnée supprimée avec succès.'
  end

  private

  def set_nb_garanty
    @nb_garanty = NbGarantie.find(params[:id])
  end

  def nb_garanty_params
    params.require(:nb_garantie).permit(:week, :ge, :gcp, :gar)
  end
end
