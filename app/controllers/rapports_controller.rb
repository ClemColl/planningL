class RapportsController < ApplicationController
  before_action :set_machine
  before_action :set_rapport, only: [:show, :edit, :update, :destroy]


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
      current_rapports = Rapport.where(machine_id: @rapport.machine_id, week: @rapport.week, created_at: (Date.today-6.months)..Date.today.end_of_day)
      if current_rapports.count > 1
        current_rapports.first.delete
      end
      redirect_to suivi_path, notice: 'Rapport enregistré avec succès'
    else
      render :new
    end
  end

  def update
    if @rapport.update(rapport_params)
      redirect_to suivi_path, notice: 'Rapport modifié avec succès'
    else
      render :edit
    end
  end

  def destroy
    @rapport.destroy
    redirect_to suivi_path, notice: 'Rapport supprimé avec succès'
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
