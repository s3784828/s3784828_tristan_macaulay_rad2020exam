class CitiesController < ApplicationController
  before_action :find_default
  before_action :update_time
  before_action :set_city, only: [:show, :edit, :update, :destroy]


  # GET /cities
  # GET /cities.json
  def index
    @cities = City.all
    @enable_standard_format = true
    @selectable_cities = []
    @cities.each do |city|
      @selectable_cities << [city.name, city.id]
    end

    if params[:new_default].present?
      City.find_by(id: @default.id).remove_default
      City.find_by(id: params[:new_default]).make_default
      redirect_to root_url
    end

    if params[:change_time_format] == "1"
      @enable_standard_format = false
    end

    if params[:change_time_format] == "0"
      @enable_standard_format = true
    end

  end

  # GET /cities/new
  def new
    @city = City.new
  end

  # POST /cities
  # POST /cities.json
  def create

    if params[:search].present?
      @search_result = Resource.find_by(city_name: params[:search].downcase)
      if (!@search_result.nil?)
        @city = City.new(
          :name => @search_result.city_name,
          :offset => @search_result.offset,
          :default => false,
          :time => Time.current,
          :time_status => "",
          :time_difference => 0.0
        )
        @city.save
        redirect_to root_url
      else
        redirect_to root_url
      end
    end
  end

  # DELETE /cities/1
  # DELETE /cities/1.json
  def destroy
    @city.destroy
    respond_to do |format|
      format.html { redirect_to cities_url, notice: 'City was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def find_default
      City.all.each do |city|
        if city.default
          @default = city
        end
      end
    end

    def set_city
      @city = City.find(params[:id])
    end

    def update_time
      City.all.each do |city|
        city.update_time
        city.update_time_status
        city.update_day_status @default
        city.update_time_difference @default
      end
    end

    # Only allow a list of trusted parameters through.
    def city_params
      params.permit(:name, :time, :offset, :default, :time_status, :time_difference)
    end
end
