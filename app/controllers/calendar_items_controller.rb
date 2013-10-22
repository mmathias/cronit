class CalendarItemsController < ApplicationController
	def show
		@calendar = Calendar.find(params[:id])
    	@calendar_items = @calendar.calendar_items.paginate(page: params[:page])
	end
end
