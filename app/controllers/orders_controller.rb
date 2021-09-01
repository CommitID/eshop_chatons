class OrdersController < ApplicationController
  before_action :set_order, only: %i[show edit update destroy]

  # GET /orders or /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1 or /orders/1.json
  def show; end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit; end

  # POST /orders or /orders.json
  def create
    @cart = @cart
    @total = @cart.total_price

    @order = Order.new(user: current_user)
    @order_items = @cart.items.each do |it|
      OrderItem.create(item_id: it.id, order_id: @order.id)
    end

    if @order.save
      flash[:notice] = 'Bravo'
      @cart.trasher
      redirect_to root_path
    else
      flash[:alert] = 'Pas bravo'
      redirect_to @cart
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def order_params
    params.fetch(:order, {})
  end
end
