class Public::ItemsController < ApplicationController
  def index
    @genres = Genre.all
    if params[:name]
      items = Item.where('name LIKE ?', "%#{params[:name]}%")
      @items = items.page(params[:page])
    elsif params[:genre_id]
      items = Item.where('genre_id LIKE ?', "%#{params[:genre_id]}%")
      @items = items.page(params[:page])
    else
      @items = Item.page(params[:page])
    end
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  # def create
  #   @cart_item = CartItem.new(cart_item_params)
  #   @cart_item.save
  #   redirect_to cart_items_path
  # end

  # private
  # def cart_item_params
  #   params.require(:cart_item).permit(:customer_id, :item_id, :amount)
  # end

end
