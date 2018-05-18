class OrdersController < ApplicationController
  
  before_action :authenticate_user!
  load_and_authorize_resource
  

  def index
    if current_user.admin?
      @orders = Order.includes(:product).all
    else
      @orders = current_user.orders.includes(:product) 
    end  
  end

  def show
    @order = Order.find(params[:id])
    
  end

  def new
  end

  def create
  end

  def destroy
  end

end