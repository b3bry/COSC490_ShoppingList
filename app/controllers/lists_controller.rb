class ListsController < ApplicationController
  def dashboard
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(params.require(:list).permit(:name))
    if @list.save
      redirect_to lists_dashboard_url
    end
  end

  def view

    @list_id = params[:list_id]
    @list = List.find_by(id: @list_id)
    @items = @list.items
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to :back
  end

  def delete
  end
end
