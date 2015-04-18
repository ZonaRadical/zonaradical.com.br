class VideoCategoriesController < ApplicationController
  load_and_authorize_resource

  # GET /video_categories
  # GET /video_categories.json
  def index
    @video_categories = VideoCategory.all
  end

  # GET /video_categories/1
  # GET /video_categories/1.json
  def show
    @videos = @video_category.videos.sort_by { |a| [ a.created_at ] }.reverse
    #.page(params[:page])
  end

  # GET /video_categories/new
  def new
    @video_category = VideoCategory.new
  end

  # GET /video_categories/1/edit
  def edit
  end

  # POST /video_categories
  # POST /video_categories.json
  def create
    @video_category = VideoCategory.new(video_category_params)

    respond_to do |format|
      if @video_category.save
        format.html { redirect_to @video_category, notice: 'Video category was successfully created.' }
        format.json { render :show, status: :created, location: @video_category }
      else
        format.html { render :new }
        format.json { render json: @video_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /video_categories/1
  # PATCH/PUT /video_categories/1.json
  def update
    respond_to do |format|
      if @video_category.update(video_category_params)
        format.html { redirect_to @video_category, notice: 'Video category was successfully updated.' }
        format.json { render :show, status: :ok, location: @video_category }
      else
        format.html { render :edit }
        format.json { render json: @video_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /video_categories/1
  # DELETE /video_categories/1.json
  def destroy
    @video_category.destroy
    respond_to do |format|
      format.html { redirect_to video_categories_url, notice: 'Video category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def video_category_params
    params.require(:video_category).permit(:name, :parent_id, :description, :image)
  end
end
