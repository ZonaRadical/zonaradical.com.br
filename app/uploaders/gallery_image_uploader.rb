# encoding: utf-8

class GalleryImageUploader < CarrierWave::Uploader::Base

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
    process resize_to_limit(100,100)
  end

  version :slider do
    process :create_thumb=>[635,372]
  end

  version :tip_slider do
    process :create_thumb=>[701,410]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def create_thumb(width, height)
    manipulate! do |source|
      if source.columns > source.rows
        # original is landscape
        source=source.resize_to_fit(width, height)
      else
        # original is portrait
        source=source.resize_to_fit(width, height)
      end
      background = Magick::Image.new(width,height){self.background_color = 'white'}
      background.composite(source,Magick::CenterGravity,Magick::SrcInCompositeOp)
    end
  end
  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
