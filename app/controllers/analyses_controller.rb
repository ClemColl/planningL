class AnalysesController < ApplicationController
  before_action :set_analysis, only: [:update, :destroy]

  def edit
  end

  def create
    @analysis = Analyse.new(analysis_params)

    if @analysis.save
      redirect_to @analysis, notice: 'Analyse was successfully created.'
      render :show, status: :created, location: @analysis
    else
      render :new
    end
  end

  def update
    if @analysis.update(analysis_params)
      redirect_to @analysis, notice: 'Analyse was successfully updated.'
    else
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_analysis
      @analysis = Analyse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def analysis_params
      params.require(:analysis).permit(:type, :efficacite, :utilisation, :equipe_id)
    end
end
