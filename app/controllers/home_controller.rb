class HomeController < ApplicationController
  def index
    @paintings = Painting.all.by_status
    render :index
  end
end
