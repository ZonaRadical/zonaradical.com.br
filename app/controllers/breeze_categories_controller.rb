class BreezeCategoriesController < ApplicationController
  load_and_authorize_resource

  # GET /breeze_categories
  # GET /breeze_categories.json
  def index
    @breeze_categories = BreezeCategory.all
  end

  # GET /breeze_categories/1
  # GET /breeze_categories/1.json
  def show
    @breezes = @breeze_category.breezes.page(params[:page])
  end

  # GET /breeze_categories/new
  def new
    @breeze_category = BreezeCategory.new
  end

  # GET /breeze_categories/1/edit
  def edit
  end

  # POST /breeze_categories
  # POST /breeze_categories.json
  def create
    @breeze_category = BreezeCategory.new(breeze_category_params)

    respond_to do |format|
      if @breeze_category.save
        format.html { redirect_to @breeze_category, notice: 'Breeze category was successfully created.' }
        format.json { render :show, status: :created, location: @breeze_category }
      else
        format.html { render :new }
        format.json { render json: @breeze_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /breeze_categories/1
  # PATCH/PUT /breeze_categories/1.json
  def update
    respond_to do |format|
      if @breeze_category.update(breeze_category_params)
        format.html { redirect_to @breeze_category, notice: 'Breeze category was successfully updated.' }
        format.json { render :show, status: :ok, location: @breeze_category }
      else
        format.html { render :edit }
        format.json { render json: @breeze_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /breeze_categories/1
  # DELETE /breeze_categories/1.json
  def destroy
    @breeze_category.destroy
    respond_to do |format|
      format.html { redirect_to breeze_categories_url, notice: 'Breeze category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def breeze_category_params
    params.require(:breeze_category).permit(:name, :parent_id, :description, :image)
  end
end
