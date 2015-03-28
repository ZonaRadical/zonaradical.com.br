class ImageGalleriesController < ApplicationController
  include Gallerable
  load_and_authorize_resource
  before_action :load_user, unless: -> { params[:user_id].nil? }

  # GET /image_gallerys
  # GET /image_gallerys.json
  def index
    load_image_galleries
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
    build_image_gallery
    respond_to do |format|
      if @image_gallery.save
        create_gallery_images(@image_gallery)
        format.html { redirect_to [@user, @image_gallery], notice: 'ImageGallery was successfully created.' }
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

      update_gallery_images(@image_gallery)

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
      format.html { redirect_to image_galleries_url, notice: 'ImageGallery was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def load_image_galleries
    @image_galleries = image_gallery_scope.page(params[:page]).to_a
  end

  def build_image_gallery
    @image_gallery = image_gallery_scope.build
    @image_gallery.attributes = image_gallery_params
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def image_gallery_params
    params.require(:image_gallery).permit(:title, :description,
                                :image_gallerable_id)
  end

  def image_gallery_scope
    @user.present? ? @user.image_galleries : ImageGallery.all
  end

  def load_user
    @user = User.find(params[:user_id])
  end
end