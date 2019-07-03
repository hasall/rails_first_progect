# frozen_string_literal: true

# My Comment
class ApplicationController < ActionController::API
  # protect_from_forgery with: :exception
  include Pagy::Backend
  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found
  # rescue_from ArgumentError, with: :handle_not_found

  private

  def handle_not_found
    render status: :not_found
    # render 404
  end
end
