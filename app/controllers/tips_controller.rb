class TipsController < ApplicationController
  include Gallerable
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

  def slug
    @tip = Tip.new title: params[:title]
    render json: { slug: @tip.slug_preview }
  end

  def tip_redirect
    redirect_to show_tip_path(@tip.tip_category, @tip), status: :moved_permanently
  end

  # POST /tips
  # POST /tips.json
  def create
    @tip = Tip.new(tip_params)
    respond_to do |format|
      if @tip.save

        create_gallery_images(@tip)

        format.html { redirect_to show_tip_path(@tip.tip_category, @tip), notice: 'Tip was successfully created.' }
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

      update_gallery_images(@tip)

      if @tip.update(tip_params)
        format.html { redirect_to show_tip_path(@tip.tip_category, @tip), notice: 'Tip was successfully updated.' }
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
                                :short_description, :slug)
  end
end
