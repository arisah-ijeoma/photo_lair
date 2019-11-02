class PhotosController < ApplicationController
  def index; end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)

    if @photo.save
      # TODO: redirect to your wardrobe
      redirect_to photos_path
    else
      render :new
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:caption, :image)
  end
end
