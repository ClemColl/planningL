class AnalyzesController < ApplicationController
  before_action :set_analyze, only: [:show, :edit, :update, :destroy]

  # GET /analyzes
  # GET /analyzes.json
  def index
    @analyzes = Analyze.all
  end

  # GET /analyzes/1
  # GET /analyzes/1.json
  def show
  end

  # GET /analyzes/new
  def new
    @analyze = Analyze.new
  end

  # GET /analyzes/1/edit
  def edit
  end

  # POST /analyzes
  # POST /analyzes.json
  def create
    @analyze = Analyze.new(analyze_params)

    respond_to do |format|
      if @analyze.save
        format.html { redirect_to @analyze, notice: 'Analyze was successfully created.' }
        format.json { render :show, status: :created, location: @analyze }
      else
        format.html { render :new }
        format.json { render json: @analyze.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /analyzes/1
  # PATCH/PUT /analyzes/1.json
  def update
    respond_to do |format|
      if @analyze.update(analyze_params)
        format.html { redirect_to @analyze, notice: 'Analyze was successfully updated.' }
        format.json { render :show, status: :ok, location: @analyze }
      else
        format.html { render :edit }
        format.json { render json: @analyze.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /analyzes/1
  # DELETE /analyzes/1.json
  def destroy
    @analyze.destroy
    respond_to do |format|
      format.html { redirect_to analyzes_url, notice: 'Analyze was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_analyze
      @analyze = Analyze.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def analyze_params
      params.fetch(:analyze, :efficacite, :utilisation, :eff_obj, :util_obj)
    end
end
