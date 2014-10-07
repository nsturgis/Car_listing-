require 'rails_helper'

feature 'user adds a new car' do

  scenario 'user completes required fields with valid info' do
    visit manufacturer_path(1)


    fill_in 'Color', with: 'blue'
    fill_in 'Mileage', with: 100
    fill_in 'Year', with: 1992

    click_on 'Create Car'

    expect(page).to have_content 'Car Saved Successfully'
    expect(page).to have_content 'blue'
    expect(page).to have_content 100
    expect(page).to have_content 1992
  end

  scenario 'user enters invalid year' do
    visit manufacturer_path(1)
    fill_in 'Color', with: 'blue'
    fill_in 'Mileage', with: 1992
    fill_in 'Year', with: 1234
    click_on 'Create Car'

    expect(page).to_not have_content 'Car Saved Successfully'
    expect(page).to have_content 'Error'
  end

  scenario 'user enters invalid info' do
    visit manufacturer_path(1)
    click_on 'Create Car'

    expect(page).to_not have_content 'Car Saved Successfully'
    expect(page).to have_content 'Error'
  end
end
