class RotationStocksController < ApplicationController
  before_action :set_rotation_stock, only: [:edit, :update, :destroy]

  def new
    @rotation_stock = RotationStock.new
  end

  def edit; end

  def create
    @rotation_stock = RotationStock.new(rotation_stock_params)

    if @rotation_stock.save
      redirect_to indicateurs_path, notice: 'Donnée créée avec succès.'
    else
      render :new
    end
  end

  def update
    if @rotation_stock.update(rotation_stock_params)
      redirect_to indicateurs_data_path, notice: 'Donnée modifiée avec succès.'
    else
      render :edit
    end
  end

  def destroy
    @rotation_stock.destroy
    redirect_to indicateurs_data_path, notice: 'Donnée supprimée avec succès.'
  end

  private

  def set_rotation_stock
    @rotation_stock = RotationStock.find(params[:id])
  end

  def rotation_stock_params
    params.require(:rotation_stock).permit(:rotation, :objectif, :mois)
  end
end
