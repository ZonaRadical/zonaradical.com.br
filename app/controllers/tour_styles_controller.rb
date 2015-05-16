class TourStylesController < ApplicationController
  before_action :set_tour_style, only: [:show, :edit, :update, :destroy]

  # GET /tour_styles
  # GET /tour_styles.json
  def index
    @tour_styles = TourStyle.all
  end

  # GET /tour_styles/1
  # GET /tour_styles/1.json
  def show
  end

  # GET /tour_styles/new
  def new
    @tour_style = TourStyle.new
  end

  # GET /tour_styles/1/edit
  def edit
  end

  # POST /tour_styles
  # POST /tour_styles.json
  def create
    @tour_style = TourStyle.new(tour_style_params)

    respond_to do |format|
      if @tour_style.save
        format.html { redirect_to @tour_style, notice: 'Tour style was successfully created.' }
        format.json { render :show, status: :created, location: @tour_style }
      else
        format.html { render :new }
        format.json { render json: @tour_style.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tour_styles/1
  # PATCH/PUT /tour_styles/1.json
  def update
    respond_to do |format|
      if @tour_style.update(tour_style_params)
        format.html { redirect_to @tour_style, notice: 'Tour style was successfully updated.' }
        format.json { render :show, status: :ok, location: @tour_style }
      else
        format.html { render :edit }
        format.json { render json: @tour_style.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tour_styles/1
  # DELETE /tour_styles/1.json
  def destroy
    @tour_style.destroy
    respond_to do |format|
      format.html { redirect_to tour_styles_url, notice: 'Tour style was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tour_style
      @tour_style = TourStyle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tour_style_params
      params.require(:tour_style).permit(:name, :description)
    end
end
