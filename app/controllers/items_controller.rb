class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render "items/new"
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  private
  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :condition_id, :shipping_cost_id, :shipping_area_id, :shipping_time_id, :price, :user_id, :image).merge(user_id: current_user.id)
  end

end
