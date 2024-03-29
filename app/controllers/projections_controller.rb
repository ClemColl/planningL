class ProjectionsController < ApplicationController
  before_action :set_projection, only: [:edit, :update, :destroy]

  def index
    @projections = Projection.all
  end

  def new
    @projection = Projection.new
  end

  def edit; end

  def create
    @projection = Projection.new(projection_params)

    if @projection.save
      redirect_to projections_path, notice: 'Donnée créée avec succès.'
    else
      render :new
    end
  end

  def update
    if @projection.update(projection_params)
      redirect_to projections_path, notice: 'Donnée modifiée avec succès.'
    else
      render :edit
    end
  end

  def destroy
    @projection.destroy
    redirect_to projections_path, notice: 'Donnée supprimée avec succès.'
  end

  private

  def set_projection
    @projection = Projection.find(params[:id])
  end

  def projection_params
    params.require(:projection).permit(:week, :obj, :prof_act, :proj)
  end
end
