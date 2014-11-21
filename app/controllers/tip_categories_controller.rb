class TipCategoriesController < ApplicationController
  load_and_authorize_resource

  # GET /tip_categories
  # GET /tip_categories.json
  def index
    @tip_categories = TipCategory.all
  end

  # GET /tip_categories/1
  # GET /tip_categories/1.json
  def show
    @tips = @tip_category.tips.page(params[:page])
  end

  # GET /tip_categories/new
  def new
    @tip_category = TipCategory.new
  end

  # GET /tip_categories/1/edit
  def edit
  end

  # POST /tip_categories
  # POST /tip_categories.json
  def create
    @tip_category = TipCategory.new(tip_category_params)

    respond_to do |format|
      if @tip_category.save
        format.html { redirect_to @tip_category, notice: 'Tip category was successfully created.' }
        format.json { render :show, status: :created, location: @tip_category }
      else
        format.html { render :new }
        format.json { render json: @tip_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tip_categories/1
  # PATCH/PUT /tip_categories/1.json
  def update
    respond_to do |format|
      if @tip_category.update(tip_category_params)
        format.html { redirect_to @tip_category, notice: 'Tip category was successfully updated.' }
        format.json { render :show, status: :ok, location: @tip_category }
      else
        format.html { render :edit }
        format.json { render json: @tip_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tip_categories/1
  # DELETE /tip_categories/1.json
  def destroy
    @tip_category.destroy
    respond_to do |format|
      format.html { redirect_to tip_categories_url, notice: 'Tip category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def tip_category_params
      params.require(:tip_category).permit(:name, :parent_id, :description)
    end
end
