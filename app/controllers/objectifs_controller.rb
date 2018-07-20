class ObjectifsController < ApplicationController
  before_action :set_objectif, only: [:show, :edit, :update, :destroy]

  # GET /objectifs
  # GET /objectifs.json
  def index
    @objectifs = Objectif.all
  end

  # GET /objectifs/1
  # GET /objectifs/1.json
  def show
  end

  # GET /objectifs/new
  def new
    @objectif = Objectif.new
  end

  # GET /objectifs/1/edit
  def edit
  end

  # POST /objectifs
  # POST /objectifs.json
  def create
    @objectif = Objectif.new(objectif_params)

    respond_to do |format|
      if @objectif.save
        format.html { redirect_to @objectif, notice: 'Objectif was successfully created.' }
        format.json { render :show, status: :created, location: @objectif }
      else
        format.html { render :new }
        format.json { render json: @objectif.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /objectifs/1
  # PATCH/PUT /objectifs/1.json
  def update
    respond_to do |format|
      if @objectif.update(objectif_params)
        format.html { redirect_to objectifs_path, notice: 'Objectif was successfully updated.' }
        format.json { render :show, status: :ok, location: @objectif }
      else
        format.html { render :edit }
        format.json { render json: @objectif.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /objectifs/1
  # DELETE /objectifs/1.json
  def destroy
    @objectif.destroy
    respond_to do |format|
      format.html { redirect_to objectifs_url, notice: 'Objectif was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_objectif
      @objectif = Objectif.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def objectif_params
      params.require(:objectif).permit(:name, :value)
    end
end
