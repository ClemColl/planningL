class PersonnesController < ApplicationController
  before_action :set_personne, only: [:show, :edit, :update, :destroy]

  # GET /personnes
  # GET /personnes.json
  def index
    @personnes = Personne.all
  end

  # GET /personnes/1
  # GET /personnes/1.json
  def show
  end

  # GET /personnes/new
  def new
    @personne = Personne.new
  end

  # GET /personnes/1/edit
  def edit
  end

  # POST /personnes
  # POST /personnes.json
  def create
    @personne = Personne.new(personne_params)

    respond_to do |format|
      if @personne.save
        format.html { redirect_to @personne, notice: 'Personne was successfully created.' }
        format.json { render :show, status: :created, location: @personne }
      else
        format.html { render :new }
        format.json { render json: @personne.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /personnes/1
  # PATCH/PUT /personnes/1.json
  def update
    respond_to do |format|
      if @personne.update(personne_params)
        format.html { redirect_to @personne, notice: 'Personne was successfully updated.' }
        format.json { render :show, status: :ok, location: @personne }
      else
        format.html { render :edit }
        format.json { render json: @personne.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personnes/1
  # DELETE /personnes/1.json
  def destroy
    @personne.destroy
    respond_to do |format|
      format.html { redirect_to personnes_url, notice: 'Personne was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_personne
      @personne = Personne.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def personne_params
      params.require(:personne).permit(:name)
    end
end
