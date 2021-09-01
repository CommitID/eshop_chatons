class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @cart = @cart
  end

  def destroy
    @cart.trasher
    flash[:notice] = 'Panier vidé.'
    redirect_to cart_path
  end
end
