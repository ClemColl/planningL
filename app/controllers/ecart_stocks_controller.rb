class EcartStocksController < ApplicationController
  before_action :set_ecart_stock, only: [:edit, :update, :destroy]

  def new
    @ecart_stock = EcartStock.new
  end

  def edit; end

  def create
    @ecart_stock = EcartStock.new(ecart_stock_params)

    if @ecart_stock.save
      redirect_to indicateurs_path, notice: 'Donnée créée avec succès.'
    else
      render :new
    end
  end

  def update
    if @ecart_stock.update(ecart_stock_params)
      redirect_to indicateurs_data_path, notice: 'Donnée modifiée avec succès.'
    else
      render :edit
    end
  end

  def destroy
    @ecart_stock.destroy
    redirect_to indicateurs_data_path, notice: 'Donnée supprimée avec succès.'
  end

  private

  def set_ecart_stock
    @ecart_stock = EcartStock.find(params[:id])
  end

  def ecart_stock_params
    params.require(:ecart_stock).permit(:valeur, :ecart, :obj)
  end
end
