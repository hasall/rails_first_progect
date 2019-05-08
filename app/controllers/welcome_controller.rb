class WelcomeController < ApplicationController
  def index
    #params[:status]
    @p = City.first

  end
end
