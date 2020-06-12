class CitiesController < ApplicationController
  before_action :find_default
  before_action :set_standard_format, only: [:index]
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
      puts "present"
      puts params[:new_default].to_s
      City.find_by(id: @default.id).remove_default
      City.find_by(id: params[:new_default]).make_default
      redirect_to root_url
    end

    if params[:change_time_format] == "1"
      puts "CHANGING FORMAT"
      # if @enable_standard_format
      #   @enable_standard_format = false
      # else
      #   @enable_standard_format = true
      # end
      @enable_standard_format = false
    end

    if params[:change_time_format] == "0"
      puts "CHANGING FORMAT"
      # if @enable_standard_format
      #   @enable_standard_format = false
      # else
      #   @enable_standard_format = true
      # end
      @enable_standard_format = true
    end

  end

  # GET /cities/1
  # GET /cities/1.json
  def show
  end

  # GET /cities/new
  def new
    @city = City.new

  end

  # GET /cities/1/edit
  def edit
  end

  # POST /cities
  # POST /cities.json
  def create

    if params[:search].present?
      #@search_result = Resource.find_by("lower(city_name) LIKE :search", search: "%#{@search}%")
      #@search_result = Resource.find_by("city_name LIKE :search", search: "#{@search}")
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
    
    #@city = City.new(city_params)

     

    # respond_to do |format|
    #   if @city.save
    #     format.html { redirect_to @city, notice: 'City was successfully created.' }
    #     format.json { render :index, status: :created, location: @city }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @city.errors, status: :unprocessable_entity }
    #   end
    # end
  # PATCH/PUT /cities/1
  # PATCH/PUT /cities/1.json
  def update
    respond_to do |format|
      if @city.update(city_params)
        format.html { redirect_to @city, notice: 'City was successfully updated.' }
        format.json { render :show, status: :ok, location: @city }
      else
        format.html { render :edit }
        format.json { render json: @city.errors, status: :unprocessable_entity }
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

    def set_standard_format
      #@enable_standard_format = true
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
