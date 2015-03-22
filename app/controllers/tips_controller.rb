class TipsController < ApplicationController
  include ImageGallery
  load_and_authorize_resource

  # GET /tips
  # GET /tips.json
  def index
    @tips = Tip.page(params[:page])
  end

  # GET /tips/1
  # GET /tips/1.json
  def show
  end

  # GET /tips/new
  def new
    @tip = Tip.new
  end

  # GET /tips/1/edit
  def edit
  end

  # POST /tips
  # POST /tips.json
  def create
    @tip = Tip.new(tip_params)
    respond_to do |format|
      if @tip.save

        unless params[:gallery_images].nil? || params[:gallery_images][:images].nil?
          params[:gallery_images][:images].each do |i|
            @tip.gallery_images.create image: i
          end
        end

        format.html { redirect_to @tip, notice: 'Tip was successfully created.' }
        format.json { render :show, status: :created, location: @tip }
      else
        format.html { render :new }
        format.json { render json: @tip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tips/1
  # PATCH/PUT /tips/1.json
  def update
    respond_to do |format|

      unless params[:gallery_images].nil?
        unless params[:gallery_images][:images].nil?
          params[:gallery_images][:images].each do |i|
            @tip.gallery_images.create image: i
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

      if @tip.update(tip_params)
        format.html { redirect_to @tip, notice: 'Tip was successfully updated.' }
        format.json { render :show, status: :ok, location: @tip }
      else
        format.html { render :edit }
        format.json { render json: @tip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tips/1
  # DELETE /tips/1.json
  def destroy
    @tip.destroy
    respond_to do |format|
      format.html { redirect_to tips_url, notice: 'Tip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def tip_params
    params.require(:tip).permit(:title, :image, :remove_image,
                                :tip_category_id, :level1_description,
                                :level2_description, :level3_description,
                                :short_description)
  end
end