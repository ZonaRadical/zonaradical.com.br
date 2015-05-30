class ResortsController < ApplicationController
  load_and_authorize_resource

  # GET /resorts
  # GET /resorts.json
  def index
    @resorts = Resort.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /resorts/1
  # GET /resorts/1.json
  def show
  end

  # GET /resorts/new
  def new
    @resort = Resort.new
  end

  # GET /resorts/1/edit
  def edit
  end

  # POST /resorts
  # POST /resorts.json
  def create
    @resort = Resort.new(resort_params)
    respond_to do |format|
      if @resort.save
        unless params[:gallery_images].nil? || params[:gallery_images][:images].nil?
          params[:gallery_images][:images].each do |i|
            @resort.gallery_images.create image: i
          end
        end

        format.html { redirect_to @resort, notice: 'Resort was successfully created.' }
        format.json { render :show, status: :created, location: @resort }
      else
        format.html { render :new }
        format.json { render json: @resort.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resorts/1
  # PATCH/PUT /resorts/1.json
  def update
    respond_to do |format|
      if @resort.update(resort_params)

        unless params[:gallery_images].nil?
          unless params[:gallery_images][:images].nil?
            params[:gallery_images][:images].each do |i|
              @resort.gallery_images.create image: i
            end
          end
          unless params[:gallery_images][:description].nil?
            params[:gallery_images][:description].each do |k, d|
              GalleryImage.find(k).update(description: d)
            end
          end
          unless params[:gallery_images][:remove_image].nil?
            params[:gallery_images][:remove_image].each do |k, d|
              GalleryImage.destroy(k)
            end
          end
        end

        format.html { redirect_to @resort, notice: 'Resort was successfully updated.' }
        format.json { render :show, status: :ok, location: @resort }
      else
        format.html { render :edit }
        format.json { render json: @resort.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resorts/1
  # DELETE /resorts/1.json
  def destroy
    @resort.destroy
    respond_to do |format|
      format.html { redirect_to resorts_url, notice: 'Resort was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def resort_params
      params.require(:resort).permit(
        :name, :slug, :image, :remove_image, :resort_category_id, :web,
        :fb, :map_url, :level1_description,
        :airport, :altitude_top, :altitude_bottom,
        :drop, :terrain, :lifts, :slopes
      )
    end
end
