# frozen_string_literal: true

# My comment
class ItemsController < ApplicationController
  def index
    _pagy, items = pagy(Item.all, items: 5, page: params[:page])
    render json: items
  end

  def show
    item = Item.find(params[:id])
    render json: item
  end

  def create
    item = Item.new(user: User.first, name: params[:name])
    return render json: item if item.save

    render json: { errors: item.errors }
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
