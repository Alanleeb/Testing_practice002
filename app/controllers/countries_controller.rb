class CountriesController < ApplicationController
  before_action :country, except:[:index, :new, :create]

  def index
    @countries = Country.all
  end

  def new
    
  end

  def show
    @country = Country.new
  end

  def create
    @country = Country.new(country_params)
    if @country.save
      flash[:success] = "Country Created!"
      redirect_to country_path(@country)
    else 
      render :new
    end
  end

  def edit
  end

  def update
    if @country.update(country_params)
      flash[:success] = "Country Updated"
      redirect_to country_path(@country)
    else 
      render :edit
    end
  end

  def destroy
    @country.destroy
    flash[:success] = "Country Deleted"
    redirect_to countries_path
  end

  private

  def country 
    @country = Country.find(params[:id])
  end

  def country_params
    params.require(:country).premit(:name, :population, :language, :age)
  end
end
