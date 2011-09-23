class MainController < ApplicationController
  def index
    @uploads = Upload.order("created_at DESC").limit(10)
  end
end
