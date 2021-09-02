class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @cart = @cart
    @total = @cart.total_price

    @order = Order.new(user: current_user)
    @order_items = @cart.items.each do |it|
      OrderItem.create(item_id: it.id, order: @order)
    end

    if @order.save
      flash[:notice] = 'Commande validée, veuillez consulter votre boîte mail.'
      @cart.trasher
      redirect_to order_path(@order)
    else
      flash[:alert] = 'La commande a échoué.'
      redirect_to @cart
    end
  end
end
