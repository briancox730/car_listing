require 'rails_helper'

feature 'user adds a new car' do

  # As a car salesperson
  # I want to record a newly acquired car
  # So that I can list it in my lots of cars found in the lot

  # I must specify the manufacturer, color, year, and mileage of the car.
  # Only years from 1920 and above can be specified.
  # I can optionally specify a description of the car.
  # If I enter all of the required information in the required formats, the car is recorded and I am presented with a notification of success
  # If I do not specify all of the required information in the required formats, the car is not recorded and I am presented with errors.
  # Upon successfully creating a car, I am redirected back to the index of cars.

  scenario 'user adds car and uses valid input' do
    car = FactoryGirl.create(:car)
    visit new_car_path

    select car.manufacturer.name, from: 'car[manufacturer_id]'
    fill_in 'Color', with: car.color
    fill_in 'Year', with: car.year
    fill_in 'Mileage', with: car.mileage
    fill_in 'Description', with: car.description
    click_on 'Add Car'

    expect(page).to have_content car.manufacturer.name
    expect(page).to have_content car.color
    expect(page).to have_content car.year
    expect(page).to have_content car.mileage
    expect(page).to have_content car.description
  end
  scenario 'user submits blank form' do
    visit new_car_path

    click_on 'Add Car'

    expect(page).to have_content 'can\'t be blank'
  end
  scenario 'user adds car and uses valid input'
end
