class HomeController < ApplicationController
  def index
    @paintings = Painting.order(:index_override)
    render :index
  end

  def unknown
    redirect_to home_path
  end
end
