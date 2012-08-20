class Photo < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  attr_accessible :description, :image
end
