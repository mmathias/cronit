class BusinessesController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy, :following, :followers]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  def index
    @businesses = Business.paginate(page: params[:page])
  end

  def destroy 
    Business.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to businesses_url
  end

  def show
    @business  = Business.find(params[:id])
    @calendars = @business.calendars.paginate(page: params[:page])
    @products  = @business.products.paginate(page: params[:page])
  end

  def new
    @business = Business.new
  end

  def create
    @business = Business.new(business_params)
    if @business.save
      sign_in @business
      flash[:success] = "Welcome to Cron it!"
      redirect_to @business
    else
      render 'new'
    end
  end

  def update 
    @business = Business.find(params[:id])
    if @business.update_attributes(business_params)
      flash[:success] = "Profile updated"
      sign_in @business
      redirect_to @business    
    else
      render 'edit'
    end
  end

  def edit
    @business = Business.find(params[:id])
  end

  def following
    @title = "Following"
    @business  = Business.find(params[:id])
    @businesses = @business.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @business  = Business.find(params[:id])
    @businesses = @business.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  private

    def business_params
      params.require(:business).permit(:name, :email, :password,
                                   :password_confirmation,:login_url,:description)
    end

    #before filters
    def correct_user
      @business = Business.find(params[:id])
      redirect_to(root_path) unless current_user?(@business)
    end  

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
