class WelcomeController < ApplicationController
  def index
    #params[:status]
    p = City.first
    render json: p
  end
end
