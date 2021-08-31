class CartsController < ApplicationController
  before_action :authenticate_user!
  def show
    @cart = @cart
  end

  def destroy
    @cart = @cart
  end
end
