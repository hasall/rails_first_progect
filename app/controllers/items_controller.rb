class ItemsController < ApplicationController
  def index
    pagy, records = pagy(Item.all, items: 5, page: params[:page])
    render json: records
  end

  def show
    p = Item.where(id: params[:id])
    render json: p
  end

  def create
    item =FactoryBot.create(:item, user:User.first, name: params[:name])
    render json: item
  end

  def update
    p
    p = Item.find(params[:id])
    # p.name = params[:name] if params[:name] != nil
    p.update(name: params[:name]) if params[:name] != nil
    render json: ['item' => 'update']
  end

  def destroy
    p = Item.where(id: params[:id])
    p.destroy_all
    
    head :ok
    # render json: ['item' => 'destroy']
  end

  private

  def item_params

  end
end
