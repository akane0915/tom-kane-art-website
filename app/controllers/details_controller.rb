class DetailsController < ApplicationController
  def index
    @paintings = Painting.all
  end
end
