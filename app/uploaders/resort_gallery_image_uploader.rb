# encoding: utf-8

class ResortGalleryImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  # storage :fog

  include CarrierWave::MimeTypes
  process :set_content_type

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  version :thumb do
    process :create_thumb
  end

  version :slider do
    process :create_slider
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
  def create_thumb
    manipulate! do |source|
      source = source.resize_to_fit(100,100)
      background = Magick::Image.new(100,100){self.background_color = 'white'}
      background.composite(source,Magick::CenterGravity,Magick::SrcInCompositeOp)
    end
  end

  def create_slider
    manipulate! do |source|
      source = source.resize_to_fit(635,372)
      background = Magick::Image.new(635,372){self.background_color = 'white'}
      background.composite(source,Magick::CenterGravity,Magick::SrcInCompositeOp)
    end
  end

end
