class PhotosController < ApplicationController
  def index
    @photos = Photo.all
    @photo = Photo.new
  end
  
  def new
    @photo = Photo.new
  end
  
  def show 
    @photo = Photo.find(params[:id])
  end
  
  def create
    @photo = Photo.new(params[:photo])
    if @photo.save
      redirect_to photos_path
    else
      render :new
    end
  end
  
  def edit
    @photo = Photo.find(params[:id])
  end
  
  def update
    @photo = Photo.new(params[:photo]) 
    if @photo.update_attributes(params[:photo])
      redirect_to photos_path
    else
      render :edit
    end
  end
  
  def destroy
    @photo = Photo.find(params[:id]) 
    if @photo.destroy
      redirect_to photos_path
    else
      redirect_to photos_path   
    end
  end
  
end
