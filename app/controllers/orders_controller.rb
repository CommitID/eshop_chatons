class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @total = (@cart.total_price * 100).to_i

    @session = Stripe::Checkout::Session.create(
      line_items: [{
        name: 'Photos de chat, psspsspss',
        quantity: 1,
        currency: 'eur',
        amount: @total
      }],
      payment_method_types: ['card'],
      success_url: order_success_url + '?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: order_cancel_url
    )
    redirect_to @session.url
  end

  def success
    @order = Order.new(order_params)
    @order.user = @cart.user
    @order_items = @cart.items.each do |it|
      OrderItem.create(item_id: it.id, order: @order)
    end

    if @order.save
      flash[:notice] = 'Commande validée, veuillez consulter votre boîte mail.'
      @cart.trasher
      UserMailer.order_email(current_user, @order).deliver_now
      redirect_to order_path(@order)
    else
      flash[:alert] = 'La commande a échoué.'
      redirect_to order_cancel_path
    end
  end

  def cancel
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
  end

  private

  def order_params
    params.permit(:user)
  end
end
