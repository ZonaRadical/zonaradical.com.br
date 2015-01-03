class BreezesController < ApplicationController
  load_and_authorize_resource

  # GET /breezes
  # GET /breezes.json
  def index
    @breezes = Breeze.page(params[:page])
  end

  # GET /breezes/1
  # GET /breezes/1.json
  def show
  end

  # GET /breezes/new
  def new
    @breeze = Breeze.new
  end

  # GET /breezes/1/edit
  def edit
  end

  # POST /breezes
  # POST /breezes.json
  def create
    @breeze = Breeze.new(breeze_params)
    respond_to do |format|
      if @breeze.save
        format.html { redirect_to @breeze, notice: 'Breeze was successfully created.' }
        format.json { render :show, status: :created, location: @breeze }
      else
        format.html { render :new }
        format.json { render json: @breeze.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /breezes/1
  # PATCH/PUT /breezes/1.json
  def update
    respond_to do |format|

      if @breeze.update(breeze_params)
        format.html { redirect_to @breeze, notice: 'Breeze was successfully updated.' }
        format.json { render :show, status: :ok, location: @breeze }
      else
        format.html { render :edit }
        format.json { render json: @breeze.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /breezes/1
  # DELETE /breezes/1.json
  def destroy
    @breeze.destroy
    respond_to do |format|
      format.html { redirect_to breezes_url, notice: 'Breeze was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def breeze_params
    params.require(:breeze).permit(:title, :body, :url,
                                   :image, :remove_image,
                                   :breeze_category_id)
  end
end