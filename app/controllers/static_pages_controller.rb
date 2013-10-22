class StaticPagesController < ApplicationController
  def home
  	if signed_in?
  		@calendar = current_user.calendars.build
  		@feed_items = current_user.feed.paginate(page: params[:page])
      if business? 
        @product = current_user.products.build
        @business = current_user
        render 'businesses/show'
      else
        @user = current_user
        @businesses = Business.all
        render 'users/show'
      end
  	end
  end

  def help
  end

  def about
  end
  
  def contact
  end
end
