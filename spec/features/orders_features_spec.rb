require 'rails_helper'

describe 'all things orders-related' do

  it "covers adding painting to cart" do
    test_painting = FactoryGirl.create(:painting)
    visit home_path
    click_link test_painting.title
    click_button "Add to Cart"
    expect (Order.all.first.order_number) != nil
    expect(page).to have_content "Cherry Blossom"
  end


end
