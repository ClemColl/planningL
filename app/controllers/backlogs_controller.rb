class BacklogsController < ApplicationController
  before_action :set_backlog, only: [:show, :edit, :update, :destroy]

  def index
    @backlogs = Backlog.all
  end

  def show
  end

  def new
    @backlog = Backlog.new
  end

  def edit
  end

  def create
    @backlog = Backlog.new(backlog_params)

    if @backlog.save
      redirect_to suivi_path, notice: 'Rapport enregistré avec succés'
    else
      render :new
    end
  end

  def update
    if @backlog.update(backlog_params)
      redirect_to @backlog, notice: 'Backlog was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @backlog.destroy
    redirect_to backlogs_url, notice: 'Backlog was successfully destroyed.'
  end

  private
    def set_backlog
      @backlog = Backlog.find(params[:id])
    end

    def backlog_params
      params.require(:backlog).permit(:mac, :mfc, :mfcl, :ytd, :ytdl, :mb, :ob, :quart, :week)
    end
end
