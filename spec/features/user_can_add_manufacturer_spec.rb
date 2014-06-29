require 'rails_helper'

feature 'user adds a new manufacturer' do

  # As a car salesperson
  # I want to record a car manufacturer
  # So that I can keep track of the types of cars found in the lot

  # I must specify a manufacturer name and country.
  # If I do not specify the required information, I am presented with errors.
  # If I specify the required information, the manufacturer is recorded
  # and I am redirected to the index of manufacturers


  scenario 'user adds manufacture and uses valid input' do
    visit new_manufacturer_path
    manufacture = FactoryGirl.build(:manufacturer)

    fill_in 'Name', with: manufacture.name
    fill_in 'Country', with: manufacture.country
    click_on 'Add Manufacturer'

    expect(page).to have_content manufacture.name
    expect(page).to have_content manufacture.country
  end

  scenario 'user does not add name' do
    visit new_manufacturer_path

    fill_in 'Country', with: 'Japan'
    click_on 'Add Manufacturer'

    expect(page).to have_content 'Name can\'t be blank'
  end

  scenario 'user does not add country' do
    visit new_manufacturer_path

    fill_in 'Name', with: 'Honda'
    click_on 'Add Manufacturer'

    expect(page).to have_content 'Country can\'t be blank'
  end
end
