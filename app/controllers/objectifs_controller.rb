class ObjectifsController < ApplicationController
  before_action :set_objectif, only: [:edit, :update]

  def index
    @objectifs = Objectif.all
  end

  def edit; end

  def update
    if @objectif.update(objectif_params)
      redirect_to objectifs_path, notice: 'Objectif modifié.'
    else
      render :edit
    end
  end

  private

  def set_objectif
    @objectif = Objectif.find(params[:id])
  end

  def objectif_params
    params.require(:objectif).permit(:name, :value)
  end
end
