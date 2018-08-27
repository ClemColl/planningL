class SuiviInficsController < ApplicationController
  before_action :set_suivi_infic, only: [:edit, :update, :destroy]

  def new
    @suivi_infic = SuiviInfic.new
  end

  def edit; end

  def create
    @suivi_infic = SuiviInfic.new(suivi_infic_params)

    if @suivi_infic.save
      redirect_to suivi_path, notice: 'Suivi infic was successfully created.'
    else
      render :new
    end
  end

  def update
    if @suivi_infic.update(suivi_infic_params)
      redirect_to @suivi_infic, notice: 'Suivi infic was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @suivi_infic.destroy
    redirect_to suivi_infics_url, notice: 'Suivi infic was successfully destroyed.'
  end

  private

  def set_suivi_infic
    @suivi_infic = SuiviInfic.find(params[:id])
  end

  def suivi_infic_params
    params.require(:suivi_infic).permit(:week, :sps, :obj_p, :spc, :sls, :obj_l, :slc)
  end
end
