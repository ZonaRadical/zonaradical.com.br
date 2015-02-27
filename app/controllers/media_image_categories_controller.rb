class MediaImageCategoriesController < ApplicationController
  load_and_authorize_resource

  # GET /media_image_categories
  # GET /media_image_categories.json
  def index
    @media_image_categories = MediaImageCategory.all
  end

  # GET /media_image_categories/1
  # GET /media_image_categories/1.json
  def show
    @image_galleries = @media_image_category.image_galleries.page(params[:page])
  end

  # GET /media_image_categories/new
  def new
    @media_image_category = MediaImageCategory.new
  end

  # GET /media_image_categories/1/edit
  def edit
  end

  # POST /media_image_categories
  # POST /media_image_categories.json
  def create
    @media_image_category = MediaImageCategory.new(media_image_category_params)

    respond_to do |format|
      if @media_image_category.save
        format.html { redirect_to @media_image_category, notice: 'MediaImage category was successfully created.' }
        format.json { render :show, status: :created, location: @media_image_category }
      else
        format.html { render :new }
        format.json { render json: @media_image_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /media_image_categories/1
  # PATCH/PUT /media_image_categories/1.json
  def update
    respond_to do |format|
      if @media_image_category.update(media_image_category_params)
        format.html { redirect_to @media_image_category, notice: 'MediaImage category was successfully updated.' }
        format.json { render :show, status: :ok, location: @media_image_category }
      else
        format.html { render :edit }
        format.json { render json: @media_image_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /media_image_categories/1
  # DELETE /media_image_categories/1.json
  def destroy
    @media_image_category.destroy
    respond_to do |format|
      format.html { redirect_to media_image_categories_url, notice: 'MediaImage category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def media_image_category_params
    params.require(:media_image_category).permit(:name, :parent_id, :description, :image)
  end
end
