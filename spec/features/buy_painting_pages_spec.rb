require 'rails_helper'

describe 'buy painting' do

  it 'adds painting to a cart and buys it' do
    test_painting = FactoryGirl.create(:painting)
    visit home_path
    click_link test_painting.title
    click_button "Add to Cart"
    click_link "Proceed to Checkout"
    fill_in 'charge[name]', with: 'Grady'
    fill_in 'charge[phone]', with: 5555555555
    fill_in 'charge[email]', with: 'g@g.com'
    fill_in 'charge[address1]', with: '123 sw Spruce St'
    fill_in 'charge[city]', with: 'Polan'
    fill_in 'charge[state]', with: 'Oregon'
    fill_in 'charge[zip]', with: '97000'
    fill_in 'charge[country]', with: 'USA'
    click_button 'Proceed to Payment'
    expect(page).to have_content "Please Review Your Order"
  end

  it 'throw an error' do
    test_painting = FactoryGirl.create(:painting)
    visit home_path
    click_link test_painting.title
    click_button "Add to Cart"
    click_link "Proceed to Checkout"
    fill_in 'charge[name]', with: 'Grady'
    fill_in 'charge[phone]', with: 5555555555
    fill_in 'charge[email]', with: 'g@g'
    fill_in 'charge[address1]', with: '123 sw Spruce St'
    fill_in 'charge[city]', with: 'Polan'
    fill_in 'charge[state]', with: 'Oregon'
    fill_in 'charge[zip]', with: '97000'
    fill_in 'charge[country]', with: 'USA'
    click_button 'Proceed to Payment'

    # save_and_open_page
    expect(page).to have_content "Email invalid"
  end

  it 'throw an error' do
    test_painting = FactoryGirl.create(:painting)
    visit home_path
    click_link test_painting.title
    click_button "Add to Cart"
    click_link "Proceed to Checkout"
    fill_in 'charge[name]', with: 'Grady'
    fill_in 'charge[phone]', with: 5555555555
    fill_in 'charge[email]', with: 'g@g.com'
    fill_in 'charge[address1]', with: '123 sw Spruce St'
    fill_in 'charge[city]', with: 'Polan'
    fill_in 'charge[state]', with: 'Oregon'
    fill_in 'charge[zip]', with: '97000'
    fill_in 'charge[country]', with: 'USA'
    click_button 'Proceed to Payment'
    fill_in 'Card Number', with: '4242424242424242'
    fill_in 'CVC', with: '123'
    fill_in 'MM', with: '09'
    fill_in 'YYYY', with: '18'
    click_button 'Place Your Order'
    # binding.pry
    # save_and_open_page
    expect(page).to have_content "Thank you!"
  end
end
