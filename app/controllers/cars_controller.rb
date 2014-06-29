class CarsController < ApplicationController
  def index
    @cars = Car.all.limit(10)
  end

  def new
    @car = Car.new
  end

  def create

  end
end
