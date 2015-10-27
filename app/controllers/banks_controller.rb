class BanksController < ApplicationController
  def show
    render json: Bank.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    render json: {errors: e.message }, status: :not_found
  end
end
