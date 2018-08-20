class AnalyzesController < ApplicationController
  before_action :set_analyze, only: [:show, :edit, :update, :destroy]

  def index
    @analyzes = Analyze.all
  end

  def show; end

  def new
    @analyze = Analyze.new
  end

  def edit; end

  def create
    @analyze = Analyze.new(analyze_params)

    if @analyze.save
      redirect_to @analyze, notice: 'Donnée créée avec succès.'
    else
      render :new
    end
  end

  def update
    if @analyze.update(analyze_params)
      redirect_to @analyze, notice: 'Donnée modifiée avec succès.'
    else
      render :edit
    end
  end

  def destroy
    @analyze.destroy
    redirect_to analyzes_url, notice: 'Donnée supprimée avec succès.'
  end

  private

  def set_analyze
    @analyze = Analyze.find(params[:id])
  end

  def analyze_params
    params.fetch(:analyze, :efficacite, :utilisation, :eff_obj, :util_obj)
  end
end
