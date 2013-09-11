class CalendarsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def create

    @calendar = current_user.calendars.create(calendar_params)

    actions_attributes = calendar_params["actions_attributes"];

    actions = nil
    actions_attributes.each do |key, action_attribute|
      command = action_attribute[:command]
      Rails.logger.debug("My object: #{command.inspect}")
      @calendar.actions.build(command: command)
    end

    Rails.logger.debug("My object: #{@calendar.inspect}")
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
      params.require(:calendar).permit(:start_date, :how_often, :how_long, actions_attributes: [:command, :_destroy])
    end
    
    def correct_user
      @calendar = current_user.calendars.find_by(id: params[:id])
      redirect_to root_url if @calendar.nil?
    end

end
