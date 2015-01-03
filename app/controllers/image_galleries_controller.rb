class ImageGalleriesController < ApplicationController
  load_and_authorize_resource

  # GET /image_gallerys
  # GET /image_gallerys.json
  def index
    @image_gallerys = ImageGallery.page(params[:page])
  end

  # GET /image_gallerys/1
  # GET /image_gallerys/1.json
  def show
  end

  # GET /image_gallerys/new
  def new
    @image_gallery = ImageGallery.new
  end

  # GET /image_gallerys/1/edit
  def edit
  end

  # POST /image_gallerys
  # POST /image_gallerys.json
  def create
    @image_gallery = ImageGallery.new(image_gallery_params)
    respond_to do |format|
      if @image_gallery.save

        unless params[:gallery_images][:images].nil?
          params[:gallery_images][:images].each do |i|
            @image_gallery.gallery_images.create image: i
          end
        end

        format.html { redirect_to @image_gallery, notice: 'ImageGallery was successfully created.' }
        format.json { render :show, status: :created, location: @image_gallery }
      else
        format.html { render :new }
        format.json { render json: @image_gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /image_gallerys/1
  # PATCH/PUT /image_gallerys/1.json
  def update
    respond_to do |format|

      unless params[:gallery_images].nil?
        unless params[:gallery_images][:images].nil?
          params[:gallery_images][:images].each do |i|
            @image_gallery.gallery_images.create image: i
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

      if @image_gallery.update(image_gallery_params)
        format.html { redirect_to @image_gallery, notice: 'ImageGallery was successfully updated.' }
        format.json { render :show, status: :ok, location: @image_gallery }
      else
        format.html { render :edit }
        format.json { render json: @image_gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /image_gallerys/1
  # DELETE /image_gallerys/1.json
  def destroy
    @image_gallery.destroy
    respond_to do |format|
      format.html { redirect_to image_gallerys_url, notice: 'ImageGallery was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def image_gallery_params
    params.require(:image_gallery).permit(:title, :description,
                                :media_image_category_id)
  end
end