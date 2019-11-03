class PhotosController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find_by(id: params[:wardrobe])
    @photos = if params[:wardrobe].present?
                @user.photos
              else
                Photo.all
              end
  end

  def new
    @photo = current_user.photos.new
  end

  def create
    @photo = current_user.photos.new(photo_params)

    if @photo.save
      redirect_to photos_path(wardrobe: current_user.id)
    else
      render :new
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:caption, :image)
  end
end
