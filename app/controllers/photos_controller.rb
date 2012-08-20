class PhotosController < ApplicationController
  before_filter :authenticate_admin!
  layout "admin"
  
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
    @photo.destroy
    respond_to do |format|
      format.js
    end
  end
  
end
