class OrdersController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  def index
    @orders = Order.all
  end

  # GET /orders/1
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
    if !current_user.admin?
      flash.alert = 'Employees cannot edit orders.'
      redirect_to @order
    end
  end

  # POST /orders
  def create
    @order = Order.new(order_params)

    if @order.save
      redirect_to @order, notice: 'Order was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /orders/1
  def update
    if @order.update(order_params)
      redirect_to @order, notice: 'Order was successfully updated.'
      #render :show, status: :ok, location: @order
    else
      render :edit
    end
  end

  # DELETE /orders/1
  def destroy
    if !current_user.admin?
      flash.alert = 'Employees cannot delete orders.'
      redirect_to @order
    else
      @order.destroy
      redirect_to orders_url, notice: 'Order was successfully destroyed.'
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def order_params
    params.require(:order).permit(:customer_name, :email, :delivery_method, :phone_number)
  end
end
