class CarsController < ApplicationController
  def index
    @cars = Car.all.limit(10)
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_attr)

    if @car.save
      flash[:notice] = 'Success! Car added!'
      redirect_to cars_path
    else
      flash[:notice] = 'Sorry! The car could not be saved!'
      render :new
    end
  end

  private

  def car_attr
    params.require(:car).permit(:manufacturer_id, :color, :year, :mileage, :description)
  end
end
