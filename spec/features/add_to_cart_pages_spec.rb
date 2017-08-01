require 'rails_helper'

describe 'all things orders-related' do

  it 'adds painting to a cart and shows it in cart page' do
    test_painting = FactoryGirl.create(:painting)
    visit home_path
    click_link test_painting.title
    save_and_open_page
    click_button "Add to Cart"
    save_and_open_page
    expect(page).to have_content "Cherry Blossoms"
  end

  it 'removes an item from cart' do
    test_painting = FactoryGirl.create(:painting)
    visit home_path
    click_link test_painting.title
    click_button "Add to Cart"
    click_link 'Remove'
    save_and_open_page
    expect(page).to have_no_content "Cherry Blossoms"
  end
end
