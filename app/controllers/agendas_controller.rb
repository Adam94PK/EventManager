class AgendasController < ApplicationController
  # for can can
  load_and_authorize_resource

  def create
    @event = find_event
    @agenda = @event.build_agenda(agenda_params)
    if @agenda.save
      redirect_to event_agenda_path(@event.id, @agenda)
    else
      flash.now[:danger] = 'Unpermited paramters'
      render :new
    end
  end

  def new
    @event = find_event
    @event.build_agenda
  end

  def edit
    @event = find_event
  end

  def show
    @agenda = find_event.agenda
  end

  def update
    @agenda = find_event.agenda
    if @agenda.update(agenda_params)
      redirect_to event_agenda_path(@agenda.event.id, @agenda)
    else
      flash.now[:danger] = 'Unpermited paramters'
      render :edit
    end
  end

  def destroy
    @agenda = find_agenda
    @event = @agenda.event
    if @event.users.include?(current_user)
      @agenda.destroy
      redirect_to @event
    else
      flash.now[:danger] = 'You are not allowed to do it'
    end
  end

  private

  def agenda_params
    params.require(:agenda).permit(:content, :picture)
  end

  def find_agenda
    Agenda.find(params[:id])
  end

  def find_event
    Event.find(params[:event_id])
  end
end
