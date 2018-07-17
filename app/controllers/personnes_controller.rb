class PersonnesController < ApplicationController
  before_action :set_personne, only: [:show, :edit, :update, :destroy]

  def index
    @personnes = Personne.all
  end

  def show
  end

  def new
    @equipe = Equipe.find(params[:equipe_id])
    @personne = @equipe.personnes.new
  end

  def edit
    @personne = @equipe.personnes.find(params[:id])
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

  def update
    @personne = @equipe.personnes.find(params[:id])
    if @personne.update(personne_params)
      redirect_to @personne, notice: 'Personne was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @personne = @equipe.personnes.find(params[:id])
    @personne.destroy
    redirect_to personnes_url, notice: 'Personne was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_personne
      @personne = Personne.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def personne_params
      params.require(:personne).permit(:name, :equipe_id, personne_ids: [])
    end
end
