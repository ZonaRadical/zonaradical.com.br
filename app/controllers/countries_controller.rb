class CountriesController < ApplicationController
  load_and_authorize_resource

  # GET /resorts
  # GET /resorts.json
  def index
    @countries = Country.all
  end
  # GET /resorts/1
  # GET /resorts/1.json
  def show
  end

  # GET /resorts/new
  def new
    @country = Country.new
  end

  # GET /resorts/1/edit
  def edit
  end

  # POST /resorts
  # POST /resorts.json
  def create
    @country = Country.new(country_params)
    respond_to do |format|
      if @country.save
        format.html { redirect_to @country, notice: 'Country was successfully created.' }
        format.json { render :show, status: :created, location: @country }
      else
        format.html { render :new }
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resorts/1
  # PATCH/PUT /resorts/1.json
  def update
    respond_to do |format|
      if @country.update(country_params)
        format.html { redirect_to @country, notice: 'Resort was successfully updated.' }
        format.json { render :show, status: :ok, location: @country }
      else
        format.html { render :edit }
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resorts/1
  # DELETE /resorts/1.json
  def destroy
    @country.destroy
    respond_to do |format|
      format.html { redirect_to resorts_url, notice: 'Resort was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_country
      @country = Country.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def country_params
      params.require(:country).permit(:name, :parent_id )
    end
end
