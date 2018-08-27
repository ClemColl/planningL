class SuiviPervesController < ApplicationController
  before_action :set_suivi_perf, only: [:edit, :update, :destroy]

  def new
    @suivi_perf = SuiviPerf.new
  end

  def edit; end

  def create
    @suivi_perf = SuiviPerf.new(suivi_perf_params)

    if @suivi_perf.save
      redirect_to suivi_path, notice: 'Suivi perf was successfully created.'
    else
      render :new
    end
  end

  def update
    if @suivi_perf.update(suivi_perf_params)
      redirect_to @suivi_perf, notice: 'Suivi perf was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @suivi_perf.destroy
    redirect_to suivi_perves_url, notice: 'Suivi perf was successfully destroyed.'
  end

  private

  def set_suivi_perf
    @suivi_perf = SuiviPerf.find(params[:id])
  end

  def suivi_perf_params
    params.require(:suivi_perf).permit(:week, :obj, :bcs, :bct)
  end
end
