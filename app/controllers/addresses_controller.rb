class AddressesController < ApplicationController
  def show
    render json: Address.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    render json: {errors: e.message }, status: :not_found
  end
end
