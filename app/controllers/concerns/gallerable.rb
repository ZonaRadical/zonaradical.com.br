module Gallerable
  extend ActiveSupport::Concern

  def create_gallery_images(model)
    unless params[:gallery_images].nil? || params[:gallery_images][:images].nil?
      params[:gallery_images][:images].each do |i|
        model.gallery_images.create image: i
      end
    end
  end

  def update_gallery_images(model)
    unless params[:gallery_images].nil?
      unless params[:gallery_images][:images].nil?
        params[:gallery_images][:images].each do |i|
          model.gallery_images.create image: i
        end
      end
      unless params[:gallery_images][:description].nil?
        params[:gallery_images][:description].each do |k, d|
          GalleryImage.find(k).update(description: d)
        end
      end
      unless params[:gallery_images][:order].nil?
        params[:gallery_images][:order].each do |k, d|
          GalleryImage.find(k).update(order: d)
        end
      end
      unless params[:gallery_images][:name].nil?
        params[:gallery_images][:name].each do |k, d|
          GalleryImage.find(k).update(name: d)
        end
      end
      unless params[:gallery_images][:url].nil?
        params[:gallery_images][:url].each do |k, d|
          GalleryImage.find(k).update(url: d)
        end
      end

      unless params[:gallery_images][:remove_image].nil?
        params[:gallery_images][:remove_image].each do |k, d|
          GalleryImage.destroy(k)
        end
      end
    end
  end
end