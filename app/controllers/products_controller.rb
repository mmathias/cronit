class ProductsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def index
    @business  = current_user
    @products  = @business.products.paginate(page: params[:page])
    @product = Product.new
  end

  def create

    @product = current_user.products.create(product_params)
    # actions_attributes = product_params["actions_attributes"];
    # actions = nil
    # if actions_attributes != nil
    #   actions_attributes.each do |key, action_attribute|
    #     command = action_attribute[:command]
    #     Rails.logger.debug("My object: #{command.inspect}")
    #     @product.actions.build(command: command)
    #   end
    # end
    if @product.save
      flash[:success] = "Product created!"
      redirect_to products_path
    else
      flash[:error] = "Error creating product!"
      render 'index'
    end
  end

  def edit
    @product = current_user.products.find(params[:id])
  end

  def update
    @product = current_user.products.find(params[:id])

    if @product.update_attributes(product_params)
      flash[:success] = "Product updated!"
      redirect_to products_path
    else
      flash[:error] = "Error updating product!"
      render 'index'
    end
  end

  def show
    @business  = current_user
    @products  = @business.products.paginate(page: params[:page])
    @product = @business.products.find(params[:id])
    render 'index'
  end
  
  def destroy 
    @product.destroy
		redirect_to products_path
  end

  private 
    def product_params
      params.require(:product).permit(:name, :description, :picture_url, :price, actions_attributes: [:command, :_destroy])
    end
    
    def correct_user
      @product = current_user.products.find_by(id: params[:id])
      redirect_to root_url if @product.nil?
    end

end