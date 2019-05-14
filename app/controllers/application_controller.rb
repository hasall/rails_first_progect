class ApplicationController < ActionController::API
  #protect_from_forgery with: :exception
  include Pagy::Backend
  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  private

  def handle_not_found
    render status: :not_found
  end
end
