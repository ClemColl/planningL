class PersonnesController < ApplicationController
  before_action :set_personne, only: [:show, :destroy]

  def index
    @personnes = Personne.all
  end

  def new
    @equipe = Equipe.find(params[:equipe_id])
    @personne = @equipe.personnes.new
  end

  def create
    @equipe = Equipe.find(params[:equipe_id])
    @personne = @equipe.personnes.new(personne_params)

    if @personne.save
      redirect_to equipes_path, notice: 'Personne ajoutée avec succès.'
    else
      render :new
    end
  end

  def destroy
    @personne.destroy
    redirect_to edit_equipe_path(id: params[:equipe_id]), notice: 'Personne supprimée avec succès.'
  end

  private
    def set_personne
      @personne = Personne.find(params[:id])
    end

    def personne_params
      params.require(:personne).permit(:name, :equipe_id, personne_ids: [])
    end
end
