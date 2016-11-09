class ItemsController < ApplicationController
  before_action :connect


  def index
    @items = @list.items
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
  @item = @list.items.new(item_params)
  respond_to do |format|
      if @item.save
        format.html do
          redirect_to list_items_path
        end
        format.json {render json: @item.to_json}
      else
        format.html {render :new}
        format.json {render json: @item.errors}
      end
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = @list.item.find(params[:id])
    if @item.update(item_params)
      redirect_to list_items_path
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to list_items_path
  end

  private
    def item_params
      params.require(:item).permit(:name, :description, :urgency, :complete, :list_id)
    end

    def connect
      @list = List.find(params[:list_id])
    end

end
