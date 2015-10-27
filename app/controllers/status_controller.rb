class StatusController < ApplicationController
  def index
    render json: {
      application:  'ar_host',
      status:       'running'
    }
  end
end
