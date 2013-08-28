class CalendarsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def create
    @calendar = current_user.calendars.build(calendar_params)
		if @calendar.save
			flash[:success] = "Calendar created!"
			redirect_to root_url
		else
      @feed_items = []
			render 'static_pages/home'
		end
  end
  
  def destroy 
    @calendar.destroy
		redirect_to root_url
  end
  
  private 
    def calendar_params
      params.require(:calendar).permit(:start_date, :how_often, :how_long)
#      params.require(:calendar).permit(:calendar_items)
#      params.require(:calendar).permit(:actions)
    end
    
    def correct_user
      @calendar = current_user.calendars.find_by(id: params[:id])
      redirect_to root_url if @calendar.nil?
    end

end
