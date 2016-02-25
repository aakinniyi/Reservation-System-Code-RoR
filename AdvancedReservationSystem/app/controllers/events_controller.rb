class EventsController < InheritedResources::Base
  before_filter :authenticate_admin_user!, :only=> [:edit, :new, :destroy]

	def index
		@events=Event.all.where('eventdate>? OR eventdate==?',Date.today, Date.today).order(:eventdate)
	end

  private

    def event_params
      params.require(:event).permit(:name, :eventdate, :arrival_airport_id, :description, :price)
    end
end

