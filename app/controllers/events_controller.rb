class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.where(calendar_id: $calendar_id, start: (params[:start].to_date-3)..params[:end].to_date)
  end

  def show
  end

  def new
    @event = Event.new
  end

  def newish
    @event = Event.new(event_type_id: params[:event_type_id])

    respond_to do |format|
      format.js #-> app/views/event/newish.js.erb
   end
  end

  def edit
    
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to calendar_path($calendar_id)
    end
  end

  def update
    if @event.update(event_params)
        redirect_to calendar_path($calendar_id)
    end
  end

  def destroy
    @event.destroy
  end

  private

    def set_event
      @event = Event.find(params[:id])
    end
    
    def event_params
      params.require(:event).permit(:title, :date_range, :start, :end, :color, :team_id, :calendar_id, :event_type_id, properties: {})
    end
end
