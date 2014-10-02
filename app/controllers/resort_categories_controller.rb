class ResortCategoriesController < ApplicationController
  load_and_authorize_resource

  # GET /resort_categories
  # GET /resort_categories.json
  def index
    @resort_categories = ResortCategory.all
  end

  # GET /resort_categories/1
  # GET /resort_categories/1.json
  def show
  end

  # GET /resort_categories/new
  def new
    @resort_category = ResortCategory.new
  end

  # GET /resort_categories/1/edit
  def edit
  end

  # POST /resort_categories
  # POST /resort_categories.json
  def create
    @resort_category = ResortCategory.new(resort_category_params)

    respond_to do |format|
      if @resort_category.save
        format.html { redirect_to @resort_category, notice: 'Resort category was successfully created.' }
        format.json { render :show, status: :created, location: @resort_category }
      else
        format.html { render :new }
        format.json { render json: @resort_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resort_categories/1
  # PATCH/PUT /resort_categories/1.json
  def update
    respond_to do |format|
      if @resort_category.update(resort_category_params)
        format.html { redirect_to @resort_category, notice: 'Resort category was successfully updated.' }
        format.json { render :show, status: :ok, location: @resort_category }
      else
        format.html { render :edit }
        format.json { render json: @resort_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resort_categories/1
  # DELETE /resort_categories/1.json
  def destroy
    @resort_category.destroy
    respond_to do |format|
      format.html { redirect_to resort_categories_url, notice: 'Resort category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def resort_category_params
      params.require(:resort_category).permit(:name, :parent_id, :description)
    end
end
