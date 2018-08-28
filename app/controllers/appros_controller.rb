class ApprosController < ApplicationController
  before_action :set_appro, only: [:edit, :update, :destroy]

  def new
    @appro = Appro.new
  end

  def edit; end

  def create
    @appro = Appro.new(appro_params)

    if @appro.save
      redirect_to suivi_path, notice: 'Donnée créée avec succès.'
    else
      render :new
    end
  end

  def update
    if @appro.update(appro_params)
      redirect_to suivi_bugfix_path, notice: 'Donnée modifiée avec succès.'
    else
      render :edit
    end
  end

  def destroy
    @appro.destroy
    redirect_to suivi_bugfix_path, notice: 'Donnée supprimée avec succès.'
  end

  private

  def set_appro
    @appro = Appro.find(params[:id])
  end

  def appro_params
    params.require(:appro).permit(:week, :ghh, :ghm, :sghh, :sghm)
  end
end
