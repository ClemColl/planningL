class TempsFabsController < ApplicationController
  before_action :set_temps_fab, only: [:edit, :update, :destroy]

  def new
    @temps_fab = TempsFab.new
  end

  def edit; end

  def create
    @temps_fab = TempsFab.new(temps_fab_params)

    if @temps_fab.save
      redirect_to suivi_path, notice: 'Temps fab was successfully created.'
    else
      render :new
    end
  end

  def update
    if @temps_fab.update(temps_fab_params)
      redirect_to @temps_fab, notice: 'Temps fab was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @temps_fab.destroy
    redirect_to temps_fabs_url, notice: 'Temps fab was successfully destroyed.'
  end

  private

  def set_temps_fab
    @temps_fab = TempsFab.find(params[:id])
  end

  def temps_fab_params
    params.require(:temps_fab).permit(:week, :tp, :tp_last)
  end
end