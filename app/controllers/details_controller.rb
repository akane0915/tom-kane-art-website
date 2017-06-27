class DetailsController < ApplicationController
  def index
    @paintings = Painting.all
  end

  def show
    slug = params[:id]
    @painting = Painting.find_by(slug: slug)
  end
end
