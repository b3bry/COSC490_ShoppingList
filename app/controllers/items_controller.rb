class ItemsController < ApplicationController
  def new
    @list_id = params[:list_id]
    @item = Item.new
  end

  def create
    @item = Item.new(params.require(:item).permit(:name,:list_id))
    if @item.save
      redirect_to lists_view_path(:list_id => @item.list_id)
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to :back
  end

  def delete
  end
end
