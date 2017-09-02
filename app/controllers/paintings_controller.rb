class PaintingsController < ApplicationController
  before_action :set_painting, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!

  def index
    @paintings = Painting.all
  end

  def show
  end

  def new
    @painting = Painting.new
  end

  def edit
  end

  def create
    @painting = Painting.new(painting_params)

    respond_to do |format|
      if @painting.save
        format.html { redirect_to @painting, notice: 'Painting was successfully created.' }
        format.json { render :show, status: :created, location: @painting }
      else
        format.html { render :new }
        format.json { render json: @painting.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @painting.update(painting_params)
        format.html { redirect_to @painting, notice: 'Painting was successfully updated.' }
        format.json { render :show, status: :ok, location: @painting }
      else
        format.html { render :edit }
        format.json { render json: @painting.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @painting.destroy
    respond_to do |format|
      format.html { redirect_to paintings_url, notice: 'Painting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_painting
      @painting = Painting.find(params[:id])
    end

    def painting_params
      params.require(:painting).permit(:title, :description, :year, :dimensions, :medium, :support, :status, :framed, :price, :image, :style, :pclip_image)
    end
end
