class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only:[:show, :edit, :update, :move_to_index]
  before_action :move_to_index, except: [:index,:new,:create, :show]

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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :condition_id, :shipping_cost_id, :shipping_area_id, :shipping_time_id, :price, :user_id, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    if user_signed_in? && @current_user.id != @item.user_id
      redirect_to action: :index
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
