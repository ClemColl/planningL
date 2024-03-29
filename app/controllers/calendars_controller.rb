class CalendarsController < ApplicationController
  before_action :set_calendar, only: [:show, :edit, :update, :destroy]

  # GET /calendars
  def index
    @calendars = Calendar.all
  end

  # GET /calendars/1
  def show
    $calendar_id = request.original_url.last
  end

  # GET /calendars/new
  def new
    @calendar = Calendar.new
  end

  # GET /calendars/1/edit
  def edit
  end

  # POST /calendars
  def create
    @calendar = Calendar.new(calendar_params)

    if @calendar.save
      redirect_to @calendar
    else
      render :new
    end
  end

  # PATCH/PUT /calendars/1
  def update
      if @calendar.update(calendar_params)
        redirect_to @calendar
      else
        render :edit
      end
  end

  # DELETE /calendars/1
  def destroy
    @calendar.destroy
    redirect_to calendars_url, notice: 'Calendrier supprimé avec succés.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_calendar
      @calendar = Calendar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def calendar_params
      params.require(:calendar).permit(:title)
    end
end
