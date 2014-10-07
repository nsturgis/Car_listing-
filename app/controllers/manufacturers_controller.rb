class ManufacturersController < ApplicationController
  def new
    @manufacturer = Manufacturer.new
  end

  def index
    @manufacturers = Manufacturer.all
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])
    @cars = Car.new
  end

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)
    if @manufacturer.save
      redirect_to manufacturers_path, notice: 'Successfully Added Manufacturer'
    else
      render 'manufacturers/new', notice: 'Error'
    end
  end

  private

  def manufacturer_params
    params.require(:manufacturer).permit(:name, :country)
  end
end
