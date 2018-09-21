class HomeController < ApplicationController
  def index
    @paintings = Painting.all
    render :index
  end

  def unknown
    redirect_to home_path
  end
end
