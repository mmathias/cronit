class CalendarsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def show
    @user = User.find(params[:id])
    @calendars = @user.calendars.paginate(page: params[:page])
  end

  def create

    @calendar = current_user.calendars.create(calendar_params)

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
      params.require(:calendar).permit(:start_date, :how_often, :how_long, :products_hash, actions_attributes: [:command, :_destroy])
    end
    
    def correct_user
      @calendar = current_user.calendars.find_by(id: params[:id])
      redirect_to root_url if @calendar.nil?
    end

end
