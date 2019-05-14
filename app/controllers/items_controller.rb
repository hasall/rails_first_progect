class ItemsController < ApplicationController
  def index
    pagy, records = pagy(Item.all, items: 5, page: params[:page])
    render json: records
  end

  def show
    item = Item.find(params[:id])
    render json: item
  end

  def create
    item =FactoryBot.create(:item, user:User.first, name: params[:name])
    render json: item
  end

  def update
# {
#"item" : {"name" : "myname"}
# }
    redirect_to current_account.item.find(params[:id]).tap { |item|
      item.update!(item_params)
    }
    render json: item
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy_all
    head :ok
  end

  private

  def item_params
    params.require(:item).permit(:name, :user_id)
  end
end
