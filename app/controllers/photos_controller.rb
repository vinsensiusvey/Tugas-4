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
      redirect_to photos_index_path
    else
      render "new"
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
      flash[:notice] = "Success Update Photo"
      redirect_to action: 'index'
    else
      flash[:error] = "Fail to Edit"
      render 'edit'
    end
  end

  def destroy
    @photo = Photo.find_by_id(params[:id])
    if @photo.destroy
      flash[:notice] = "Success Delete Photo"
      redirect_to action: 'index'
    else
      flash[:error] = "Fail to Delete Image"
      redirect_to action: 'index'
    end
  end

  private
    def param_photo
      params.require(:photo).permit(:title, :avatar)
    end
end
