class ReportedEventsController < ApplicationController
  def create
    report = ReportedEvent.new(report_params)
    if report.save
      redirect_to find_event
    else
      render :new
      flash[:danger] = "wrong input data"
    end
  end
  
  def new
    @report = ReportedEvent.new
    @event = find_event
    if @event.nil?
      redirect_to :back
      flash[:danger] = "no event chosen"
    end
  end
  
  private
  
  def report_params
    params.require(:reported_event).permit(:event_id, :user_id, :reason)
  end
  
  def find_event
    Event.find(params[:reported_event][:event_id])
  end
  
end
