class CarsController < ApplicationController
  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @manufacturer = Manufacturer.find(params[:manufacturer_id])
    @car.manufacturer = @manufacturer
    if @car.save
      flash[:notice] = 'Car Added Successfully'
      redirect_to manufacturer_path(@manufacturer),
      notice: 'Car Saved Successfully'
    else
      redirect_to manufacturer_path(@manufacturer), notice: 'Error'
    end
  end

  private

  def car_params
    params.require(:car).permit(:color, :mileage, :year, :description)
  end
end
