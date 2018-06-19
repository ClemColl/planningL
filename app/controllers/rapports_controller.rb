class RapportsController < ApplicationController
  before_action :set_rapport, only: [:show, :edit, :update, :destroy]
  before_action :set_machine

  def index
    @rapports = Rapport.all
  end

  def show
  end

  def new
    @rapport = Rapport.new
  end

  def edit
  end

  def create
    @rapport = Rapport.new(rapport_params)

    if @rapport.save
      redirect_to suivi_path, notice: 'Rapport enregistré avec succés.'
    else
      render :new
    end
  end

  def update
    if @rapport.update(rapport_params)
      redirect_to @rapport, notice: 'Rapport modifié avec succés.'
      render :show, status: :ok, location: @rapport
    else
      render :edit
    end
  end

  def destroy
    @rapport.destroy
    redirect_to rapports_url, notice: 'Rapport was successfully destroyed.'
  end

  private

    def set_rapport
      @rapport = @machine.rapports.find(params[:id])
    end

    def set_machine
      @machine = Machine.find(params[:machine_id])
    end

    def rapport_params
      params.require(:rapport).permit(:cas, :pdp, :cta, :dsa, :week, :next_cas, :next_pdp, :machine_id)
    end
end
