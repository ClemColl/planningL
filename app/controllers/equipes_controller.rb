class EquipesController < ApplicationController
  before_action :set_equipe, only: [:show, :edit, :update, :destroy]

  def index
    @equipes = Equipe.all
  end

  def show
  end

  def new
    @equipe = Equipe.new
  end

  def edit
  end

  def create
    @equipe = Equipe.new(equipe_params)

    if @equipe.save
      redirect_to equipes_path, notice: 'Equipe créée avec succès.'
    else
      render :new
    end
  end

  def update
    if @equipe.update(equipe_params)
      redirect_to equipes_path, notice: 'Equipe modifiée avec succès.'
    else
      render :edit
    end
  end

  def destroy
    @equipe.destroy
    redirect_to equipes_url, notice: 'Equipe was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equipe
      @equipe = Equipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def equipe_params
      params.require(:equipe).permit(:re, personne_ids: [])
    end
end
