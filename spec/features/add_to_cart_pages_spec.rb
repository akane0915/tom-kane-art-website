require 'rails_helper'

describe 'all things orders-related' do

  it 'adds painting to a cart and shows it in cart page' do
    test_painting = FactoryGirl.create(:painting)
    visit home_path
    click_link test_painting.title
    click_button "Add to Cart"
    expect(page).to have_content "Cherry Blossoms"
  end

  it 'removes an item from cart' do
    test_painting = FactoryGirl.create(:painting)
    visit home_path
    click_link test_painting.title
    click_button "Add to Cart"
    click_link 'Remove'
    expect(page).to have_no_content "Cherry Blossoms"
  end
end
