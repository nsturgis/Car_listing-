require 'rails_helper'

feature 'user adds a new car' do

  before :each do
    @manufacturer = FactoryGirl.create(:manufacturer)
    visit manufacturer_path(@manufacturer)
  end

  scenario 'user completes required fields with valid info' do
    car = FactoryGirl.build(:car)

    fill_in 'Color', with: car.color
    fill_in 'Mileage', with: car.mileage
    fill_in 'Year', with: car.year
    click_on 'Create Car'

    expect(page).to have_content 'Car Saved Successfully'
    expect(page).to have_content car.color
    expect(page).to have_content car.mileage
    expect(page).to have_content car.year
  end

  scenario 'user enters invalid year' do
    car = FactoryGirl.build(:car)

    fill_in 'Color', with: car.color
    fill_in 'Mileage', with: car.mileage
    fill_in 'Year', with: 1919
    click_on 'Create Car'

    expect(page).to_not have_content 'Car Saved Successfully'
    expect(page).to have_content 'Error'
  end

  scenario 'without required attributes' do
    click_on 'Create Car'

    expect(page).to_not have_content 'Car Saved Successfully'
    expect(page).to have_content 'Error'
  end
end
