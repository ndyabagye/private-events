class EventsController < ApplicationController
  include EventsHelper
  # before_action :require_login, except: [:index]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      flash[:success] = "Event '#{@event.title} created !"
      redirect_to @event
    else
      flash[:alert] = "Error!"
      render "new"
    end
  end

  def invites
    @event = Event.find(params[:id])
    if @event.attendees.include?.(current_user)
      redirect_to @event, notice: "You are already on the list"
    else
      @event.attendees << current_user
      redirect_to @event
    end
  end

  def cancel_invite
    @event = Event.find(params[:id])
    @event.attendees.delete(current_user)
    redirect_to @event, notice: "You are no longer attending this event!"
  end
end
