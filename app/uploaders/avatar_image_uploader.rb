# encoding: utf-8

class AvatarImageUploader < CarrierWave::Uploader::Base

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

  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url
    # For Rails 3.1+ asset pipeline compatibility:
    ActionController::Base.helpers.asset_path('/images/default_uploader/' + [version_name, 'default_avatar.jpg'].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  end

  # Process files as they are uploaded:
  version :ava do
    process :resize_to_fill => [141, 141]
  end

  version :thumb do
    process :create_thumb => [286, 162]
  end

  def create_thumb(width, height)
    manipulate! do |source|
      source = source.resize_to_fit(width,height)
      background = Magick::Image.new(width,height){self.background_color = 'white'}
      background.composite(source,Magick::CenterGravity,Magick::SrcInCompositeOp)
    end
  end
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  #version :thumb do
  #  process :resize_to_fit => [286, 162]
  #end

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

end
