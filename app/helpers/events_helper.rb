module EventsHelper
  def event_params
    params.require(:event).permit(:title, :date, :location, :description, :user_id)
  end
end
