# frozen_string_literal: true

# My comment
class ItemsController < ApplicationController
  def index
    if params[:page] != '0'
      _pagy, items = pagy(Item.all.order(:id), items: 5, page: params[:page])
    else
      items = Item.all.order(:id)
    end
    render json: items
  end

  def show
    item = Item.find(params[:id])
    render json: item
  end

  def create
    item = Item.create(user: User.first, name: params[:name])
    render json: item
  end

  def update
    # {
    # "item" : {"name" : "myname"}
    # }
    item = Item.find(params[:id])
    item.update!(item_params)

    render json: item
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy!

    head :ok
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
