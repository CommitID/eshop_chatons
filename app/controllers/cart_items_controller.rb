class CartItemsController < ApplicationController
  def create
    @cart_item = CartItem.new(cart_id: @cart.id, item_id: params[:item_id])
    if @cart_item.save
      flash[:notice] = 'Produit ajouté au panier'
    else
      flash[:alert] = "Impossible d'ajouter le produit au panier"
    end
    redirect_back fallback_location: root_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    flash[:alert] = 'Produit supprimé au panier'
    redirect_back fallback_location: root_path
  end
end
