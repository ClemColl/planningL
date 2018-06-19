class ResponsablesController < ApplicationController
  before_action :set_responsable, only: [:show, :edit, :update, :destroy]

  # GET /responsables
  # GET /responsables.json
  def index
    @responsables = Responsable.all
  end

  # GET /responsables/1
  # GET /responsables/1.json
  def show
  end

  # GET /responsables/new
  def new
    @responsable = Responsable.new
  end

  # GET /responsables/1/edit
  def edit
  end

  # POST /responsables
  # POST /responsables.json
  def create
    @responsable = Responsable.new(responsable_params)

    respond_to do |format|
      if @responsable.save
        format.html { redirect_to @responsable, notice: 'Responsable was successfully created.' }
        format.json { render :show, status: :created, location: @responsable }
      else
        format.html { render :new }
        format.json { render json: @responsable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /responsables/1
  # PATCH/PUT /responsables/1.json
  def update
    respond_to do |format|
      if @responsable.update(responsable_params)
        format.html { redirect_to @responsable, notice: 'Responsable was successfully updated.' }
        format.json { render :show, status: :ok, location: @responsable }
      else
        format.html { render :edit }
        format.json { render json: @responsable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /responsables/1
  # DELETE /responsables/1.json
  def destroy
    @responsable.destroy
    respond_to do |format|
      format.html { redirect_to responsables_url, notice: 'Responsable was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_responsable
      @responsable = Responsable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def responsable_params
      params.require(:responsable).permit(:name)
    end
end
