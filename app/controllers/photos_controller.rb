class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(param_photo)
    if @photo.save
      redirect_to photos_path, :notice => "Upload image #{@photo.title} success"
    else
      render "new", :error => "Upload image #{@photo.title} failed"
    end
  end

  def show
    @photo = Photo.find_by_id(params[:id])
  end

  def edit
    @photo = Photo.find_by_id(params[:id])
  end

  def update
    @photo = Photo.find_by_id(params[:id])
    if @photo.update(param_photo)
      redirect_to photos_path, :notice => "Update image success"
    else
      render "new", :error => "Update image failed"
    end
  end

  def destroy
    @photo = Photo.find_by_id(params[:id])
    if @photo.destroy
      redirect_to photos_path, :notice => "Delete photo success"
    else
      redirect_to photos_path, :error => "Delete photo failed"
    end
  end

  private
    def param_photo
      params.require(:photo).permit(:title, :avatar)
    end
end
