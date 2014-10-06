require 'rails_helper'

feature 'user creates a manufacturer' do

  scenario 'user adds a new manufacturer' do
    visit new_manufacturer_path
    manufacturer = FactoryGirl.create(:manufacturer)

    fill_in 'Name', with: manufacturer.name
    fill_in 'Country', with: manufacturer.country
    click_on 'Create Manufacturer'

    expect(page).to have_content 'Successfully Added Manufacturer'
  end

  scenario 'user enters incomplete manufacturer info' do
    visit new_manufacturer_path
    click_on 'Create Manufacturer'

    expect(page).to_not have_content 'Successfully Added Manufacturer'
    expect(page).to have_content 'errors'
  end
end
